// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let content = try? JSONDecoder().decode(Content.self, from: jsonData)

import Foundation

// MARK: - Content
struct Content: Codable {
    let people, planets, films, species: String?
    let vehicles, starships: String?
}
