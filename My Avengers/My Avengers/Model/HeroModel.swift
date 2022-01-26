// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hero = try? newJSONDecoder().decode(Hero.self, from: jsonData)

import Foundation

// MARK: - Hero
struct Hero: Codable, Equatable, Hashable {
    let response, resultsFor: String
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}

// MARK: - Result
struct Result: Codable, Equatable, Identifiable, Hashable {
    let id, name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let work: Work
    let connections: Connections
    let image: Image
}

// MARK: - Appearance
struct Appearance: Codable, Equatable, Hashable{
    let gender, race: String
    let height, weight: [String]
    let eyeColor, hairColor: String

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

// MARK: - Biography
struct Biography: Codable, Equatable, Hashable{
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance, publisher, alignment: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }
}

// MARK: - Connections
struct Connections: Codable, Equatable, Hashable {
    let groupAffiliation, relatives: String

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

// MARK: - Image
struct Image: Codable, Equatable, Hashable {
    let url: String
}

// MARK: - Powerstats
struct Powerstats: Codable, Equatable, Hashable {
    let intelligence, strength, speed, durability: String
    let power, combat: String
}

// MARK: - Work
struct Work: Codable, Equatable, Hashable {
    let occupation, base: String
}
