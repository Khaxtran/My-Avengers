//
//  HeroListViewModel.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation

@MainActor
class HeroListViewModel: ObservableObject {
    
    @Published var heros: [HeroViewModel] = []
    
    func search(name: String) async {
        do {
            let heros = try await WebService().fetchHero(searchTerm: name)
            self.heros = heros.map(HeroViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct HeroViewModel {
    
    let hero: Result
    
    var heroId: String {
        hero.id
    }
    
    var name: String {
        hero.name
    }
    
    var gender: String {
        hero.appearance.gender
    }
    
    var race: String {
        hero.appearance.race
    }
    
    var universe: String {
        hero.biography.publisher
    }
    
    var image: URL? {
        URL(string: hero.image.url)
    }
}
