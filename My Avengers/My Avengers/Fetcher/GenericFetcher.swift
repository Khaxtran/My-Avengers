//
//  GenericFetcher.swift
//  My Avengers
//
//  Created by Kha Tran on 23/12/21.
//

import Foundation

class GenericFetcher {
    
}

extension URLSession {
    
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Decodable> (
        url: URL? ,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        
        let task = dataTask(with: url) { data, res, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
