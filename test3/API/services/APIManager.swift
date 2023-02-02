//
//  APIManager.swift
//  test3
//
//  Created by Admin on 30.01.2023.
//

import Foundation

enum ApiType {
    
    case getContent
    case getPeoples
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
        case .getPeoples: return "people/?format=json"
        case .getPlanets: return "planets/?format=json"
        case .getFilms: return "films/?format=json"
        case .getSpecies: return "species/?format=json"
        case .getVehicles: return "vehicles/?format=json"
        case .getStarships: return "starships/?format=json"
        }
    }
    
    var request: URLRequest? {
        let urlString = baseUrl + path
        guard let url = URL(string: urlString) else {
            return nil
        }
        let request = URLRequest(url: url)
        return request
    }
    
}


class ApiManager {
    
    private let networkManager = NetworkManager()
    static let shared = ApiManager()
    
    func getContent(completion: @escaping (Result<Content, Error>) -> Void) {
        guard let request = ApiType.getContent.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }
    
    func getFilms(nextPageUrlString: String? , completion: @escaping (Result<Films, Error>) -> Void) {
        guard let request = ApiType.getFilms.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }

    func getPeoples(nextPageUrlString: String? , completion: @escaping (Result<Peoples, Error>) -> Void) {
        if let nextPageUrlString = nextPageUrlString,
           let nextPageUrl = URL(string: nextPageUrlString) {
            let request = URLRequest(url: nextPageUrl)
            self.networkManager.loadData(urlRequest: request, completion: completion)
            return
        }
        guard let request = ApiType.getPeoples.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }

    func getPlanets(nextPageUrlString: String? , completion: @escaping (Result<Planets, Error>) -> Void) {
        if let nextPageUrlString = nextPageUrlString,
           let nextPageUrl = URL(string: nextPageUrlString) {
            let request = URLRequest(url: nextPageUrl)
            self.networkManager.loadData(urlRequest: request, completion: completion)
            return
        }
        guard let request = ApiType.getPlanets.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }

    func getSpecies(nextPageUrlString: String? , completion: @escaping (Result<Species, Error>) -> Void) {
        if let nextPageUrlString = nextPageUrlString,
           let nextPageUrl = URL(string: nextPageUrlString) {
            let request = URLRequest(url: nextPageUrl)
            self.networkManager.loadData(urlRequest: request, completion: completion)
            return
        }
        guard let request = ApiType.getSpecies.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }

    func getVehicles(nextPageUrlString: String? , completion: @escaping (Result<Vehicles, Error>) -> Void) {
        if let nextPageUrlString = nextPageUrlString,
           let nextPageUrl = URL(string: nextPageUrlString) {
            let request = URLRequest(url: nextPageUrl)
            self.networkManager.loadData(urlRequest: request, completion: completion)
            return
        }
        guard let request = ApiType.getVehicles.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }

    func getStarships(nextPageUrlString: String? , completion: @escaping (Result<Starships, Error>) -> Void) {
        if let nextPageUrlString = nextPageUrlString,
           let nextPageUrl = URL(string: nextPageUrlString) {
            let request = URLRequest(url: nextPageUrl)
            self.networkManager.loadData(urlRequest: request, completion: completion)
            return
        }
        guard let request = ApiType.getStarships.request else { return }
        self.networkManager.loadData(urlRequest: request, completion: completion)
    }
    
    func getPeopleObject(objectUrl: String , completion: @escaping (Result<People, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
    
    func getPlanetObject(objectUrl: String , completion: @escaping (Result<Planet, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
    
    func getSpecieObject(objectUrl: String , completion: @escaping (Result<Specie, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
    
    func getFilmObject(objectUrl: String , completion: @escaping (Result<Film, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
    
    func getStarshipObject(objectUrl: String , completion: @escaping (Result<Starship, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
    
    func getVehicleObject(objectUrl: String , completion: @escaping (Result<Vehicle, Error>) -> Void) {
        guard let request = URL(string: objectUrl) else { return }
        self.networkManager.loadData(url: request , completion: completion)
    }
}
