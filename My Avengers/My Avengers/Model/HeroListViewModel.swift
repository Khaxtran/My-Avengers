//
//  HeroListViewModel.swift
//  My Avengers
//
//  Created by Kha Tran on 24/12/21.
//

import Foundation

@MainActor
class HeroListViewModel: ObservableObject {
    struct AppError: Identifiable {
        let id = UUID().uuidString
        let errorString: String
    }
    
    @Published var isLoading: Bool = false
    @Published var heros = [HeroViewModel]()
    @Published var recruits = [HeroViewModel]()
    
    let saveKey = "SaveData"
    
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([HeroViewModel].self, from: data) {
                recruits = decoded
                return
            }
        }
    }
    
    //Save data
    func save() {
        if let encode = try? JSONEncoder().encode(recruits) {
            UserDefaults.standard.set(encode, forKey: saveKey)
        }
    }
    
    //Recruit
    func add(hero: HeroViewModel) {
        recruits.insert(hero, at: 0)
        save()
    }
    
    func remove(hero: HeroViewModel) {
        if let index = recruits.firstIndex(of: hero) {
            recruits.remove(at: index)
            save()
        }
    }
    
    
    //Search
        func search(name: String) async {
            isLoading = true
            do {
                let heros = try await WebService().fetchHero(searchTerm: name)
                self.heros = heros.map(HeroViewModel.init)
                isLoading = false
            } catch {
                print(error)
                isLoading = false
            }
        }
    
}

struct HeroViewModel: Equatable, Identifiable, Hashable, Decodable, Encodable {
    
    let hero: Results
    
// GENERAL INFO
    
    var id: String {
        hero.id
    }
    
    var name: String {
        hero.name
    }
    
    var image: URL? {
        URL(string: hero.image.url)
    }

//BIOGRAPHY
    
    var fullName: String {
        hero.biography.fullName
    }
    
    var alterEgos: String {
        hero.biography.alterEgos
    }
    
    var aliases: [String] {
        hero.biography.aliases
    }
    var placeOfBirth: String {
        hero.biography.placeOfBirth
    }
    
    var firstAppearance: String {
        hero.biography.firstAppearance
    }
    
    var universe: String {
        hero.biography.publisher
    }
    
    var alignment: String {
        hero.biography.alignment
    }
    
//CONNECTION
    
    var groupAffiliation: String {
        hero.connections.groupAffiliation
    }
    
    var relatives: String {
        hero.connections.relatives
    }
    
//WORK
    var occupation: String {
        hero.work.occupation
    }
    
    var base: String {
        hero.work.base
    }
    
//POWER STATS
    
    var intelligence: String {
       hero.powerstats.intelligence
    }
    
    var strength: String {
        hero.powerstats.strength
    }
    
    var speed: String {
        hero.powerstats.speed
    }
    
    var durability: String {
        hero.powerstats.durability
    }
    
    var power: String {
        hero.powerstats.power
    }
    
    var combat: String {
        hero.powerstats.combat
    }
    
//APPEARANCE
    var gender: String {
        hero.appearance.gender
    }
    
    var race: String {
        hero.appearance.race
    }
    
    var height: [String] {
        hero.appearance.height
    }
    
    var weight: [String] {
        hero.appearance.weight
    }
    
    var eyeColor: String {
        hero.appearance.eyeColor
    }
    
    var hairColor: String {
        hero.appearance.hairColor
    }
}
