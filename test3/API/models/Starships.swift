// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let starships = try? JSONDecoder().decode(Starships.self, from: jsonData)

import Foundation

// MARK: - Starships
struct Starships: Codable {
    let count: Int?
    let next: String?
    let results: [Starship]?
}

// MARK: - Result
struct Starship: Codable {
    let name, model, manufacturer, cost_in_credits: String?
    let length, max_atmosphering_speed, crew, passengers: String?
    let cargo_capacity, consumables, hyperdrive_rating, mglt: String?
    let starship_class: String?
    let pilots, films: [String]?
    let created, edited: String?
    let url: String?
}

