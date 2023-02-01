// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vehicles = try? JSONDecoder().decode(Vehicles.self, from: jsonData)

import Foundation

// MARK: - Vehicles
struct Vehicles: Codable {
    let count: Int?
    let next: String?
    let results: [Vehicle]?
}

// MARK: - Result
struct Vehicle: Codable {
    let name, model, manufacturer, costInCredits: String?
    let length, maxAtmospheringSpeed, crew, passengers: String?
    let cargoCapacity, consumables, vehicleClass: String?
    let pilots, films: [String]?
    let created, edited: String?
    let url: String?
}
