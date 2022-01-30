//
//  WebService.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation

public class WebService {
    
    public static let shared = WebService()
    
    public enum NetworkError: Error {
        case error(_ errorString: String)
    }
    
    public func getJSON<T: Decodable>(urlString: String,
                                      dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                      keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                                      completion: @escaping (Result<T,NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("Error: \(error.localizedDescription)")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                return
            } catch let decodingError {
                completion(.failure(NetworkError.error("Error: \(decodingError.localizedDescription)")))
                return
            }
            
        }.resume()
    }
    
//    func fetchHero(searchTerm: String) async throws -> [Results] {
//        
//        let url = URL(string: "https://superheroapi.com/api/4632428266824459/search/\(searchTerm.trimmed())")
//        
//        guard let url = url?.absoluteURL else {
//            throw NetworkError.badURL
//        }
//        print(url.absoluteString)
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw NetworkError.badID
//        }
//        
//        let hero = try? JSONDecoder().decode(Hero.self, from: data)
//        return hero?.results ?? []
//    }
}
