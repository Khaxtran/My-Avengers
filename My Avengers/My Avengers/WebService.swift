//
//  WebService.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

class WebService {
    
    
    func fetchHero(searchTerm: String) async throws -> [Result] {
        
        let url = URL(string: "https://superheroapi.com/api/4632428266824459/search/\(searchTerm.trimmed())")
        
        guard let url = url?.absoluteURL else {
            throw NetworkError.badURL
        }
        print(url.absoluteString)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let hero = try? JSONDecoder().decode(Hero.self, from: data)
        return hero?.results ?? []
    }
}
