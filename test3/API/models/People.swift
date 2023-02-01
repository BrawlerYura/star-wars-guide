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
    let name, height, mass, hairColor: String?
    let skinColor, eyeColor, birthYear: String?
    let gender: String?
    let homeworld: String?
    let films, species, vehicles, starships: [String]?
    let created, edited: String?
    let url: String?
}


var defaultPeople = [People(name: "", height: "", mass: "", hairColor: "", skinColor: "", eyeColor: "", birthYear: "", gender: "", homeworld: "", films: [], species: [], vehicles: [], starships: [], created: "", edited: "", url: "")]

var defaultPeoples = Peoples(count: 0, next: "", results: [])
