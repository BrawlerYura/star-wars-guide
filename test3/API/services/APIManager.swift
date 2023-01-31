//
//  APIManager.swift
//  test3
//
//  Created by Admin on 30.01.2023.
//

import Foundation

enum ApiType {
    
    case getContent
    case getPeople
    case getPlanets
    case getFilms
    case getSpecies
    case getVehicles
    case getStarships
    
    var baseUrl: String {
        return "https://swapi.dev/api/"
    }
    
    var path: String {
        switch self {
        case .getContent: return "?format=json"
        case .getPeople: return "people/?format=json"
        case .getPlanets: return "planets/?format=json"
        case .getFilms: return "films/?format=json"
        case .getSpecies: return "species/?format=json"
        case .getVehicles: return "vehicles/?format=json"
        case .getStarships: return "starships/?format=json"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl)!)!
        let request = URLRequest(url: url)
        return request
    }
}


class ApiManager {
    
    static let shared = ApiManager()
    
    func getContent(completion: @escaping (Content) -> Void) {
        let request = ApiType.getContent.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let content = try? JSONDecoder().decode(Content.self, from: data) {
                print(content)
            }
        }
        task.resume()
    }
    
    func getFilms(completion: @escaping (Films) -> Void) {
        let request = ApiType.getFilms.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let films = try? JSONDecoder().decode(Films.self, from: data) {
                print(films)
            }
        }
        task.resume()
    }
    
    func getPeople(completion: @escaping (People) -> Void) {
        let request = ApiType.getPeople.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let people = try? JSONDecoder().decode(People.self, from: data) {
                print(people)
            }
        }
        task.resume()
    }
    
    func getPlanets(completion: @escaping (Planets) -> Void) {
        let request = ApiType.getPlanets.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let planets = try? JSONDecoder().decode(Planets.self, from: data) {
                print(planets)
            }
        }
        task.resume()
    }
    
    func getSpecies(completion: @escaping (Species) -> Void) {
        let request = ApiType.getSpecies.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let species = try? JSONDecoder().decode(Species.self, from: data) {
                print(species)
            }
        }
        task.resume()
    }
    
    func getVehicles(completion: @escaping (Vehicles) -> Void) {
        let request = ApiType.getVehicles.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let vehicles = try? JSONDecoder().decode(Vehicles.self, from: data) {
                print(vehicles)
            }
        }
        task.resume()
    }
    
    func getStarships(completion: @escaping (Starships) -> Void) {
        let request = ApiType.getStarships.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let starships = try? JSONDecoder().decode(Starships.self, from: data) {
                print(starships)
            }
        }
        task.resume()
    }
}
