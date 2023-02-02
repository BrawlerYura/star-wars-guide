// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let people = try? JSONDecoder().decode(People.self, from: jsonData)

import Foundation

// MARK: - People
struct Peoples: Codable {
    let count: Int?
    let next: String?
    let results: [People]?
}

// MARK: - Result
struct People: Codable {
    let name, height, mass, hair_color: String?
    let skin_color, eye_color, birth_year: String?
    let gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?
}
