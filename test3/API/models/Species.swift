// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let species = try? JSONDecoder().decode(Species.self, from: jsonData)

import Foundation

// MARK: - Species
struct Species: Codable {
    let count: Int?
    let next: String?
    let results: [Specie]?
}

// MARK: - Result
struct Specie: Codable {
    let name, classification: String?
    let designation: String?
    let average_height, skin_colors, hair_colors, eye_colors: String?
    let average_lifespan: String?
    let homeworld: String?
    let language: String?
    let people, films: [String]?
    let created, edited: String?
    let url: String?
}
