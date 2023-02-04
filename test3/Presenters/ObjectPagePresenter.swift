//
//  ObjectPagePresenter.swift
//  SW guide
//
//  Created by Admin on 04.02.2023.
//

import Foundation


protocol ObjectPagePresenterDelegate: AnyObject {
    func setText(text: String)
    func setImage(data: Data)
}


class ObjectPagePresenter {
    
    weak var delegate: ObjectPagePresenterDelegate?
    
    public func setViewDelegate(delegate: ObjectPagePresenterDelegate) {
        self.delegate = delegate
    }

    public func loadContent(contentType: String , objectUrl: String , objectID: Int)  {
        
        switch contentType {
            
        case "Characters":
            ApiManager.shared.getPeopleObject(objectUrl: objectUrl){ result in
                switch  result{
                case .success(let people):
                    self.SuccessLoadingHandle(with: people)
                case .failure(let error):
                    print(error)
                }
                
            }
            
        case "Films":
            ApiManager.shared.getFilmObject(objectUrl: objectUrl) { result in
                switch  result{
                case .success(let film):
                    self.SuccessLoadingHandle(with: film)
                case .failure(let error):
                    print(error)
                }
            }
            
        case "Vehicles":
            ApiManager.shared.getVehicleObject(objectUrl: objectUrl) { result in
                switch  result{
                case .success(let vehicle):
                    self.SuccessLoadingHandle(with: vehicle)
                case .failure(let error):
                    print(error)
                }
            }
            
        case "Species":
            ApiManager.shared.getSpecieObject(objectUrl: objectUrl) { result in
                switch  result{
                case .success(let specie):
                    self.SuccessLoadingHandle(with: specie)
                case .failure(let error):
                    print(error)
                }
            }
            
        case "Starships":
            ApiManager.shared.getStarshipObject(objectUrl: objectUrl) { result in
                switch  result{
                case .success(let starship):
                    self.SuccessLoadingHandle(with: starship)
                case .failure(let error):
                    print(error)
                }
            }
            
        case "Planets":
            ApiManager.shared.getPlanetObject(objectUrl: objectUrl) { result in
                switch  result{
                case .success(let planet):
                    self.SuccessLoadingHandle(with: planet)
                case .failure(let error):
                    print(error)
                }
            }
            
        default:
            print("no results")
        }
        
        ApiManager.shared.getObjectImage(imageID: objectID, contentType: contentType) { data, response, error in
            guard let data = data, error == nil else { return }
            self.delegate?.setImage(data: data)
        }
    }
}
    
private extension ObjectPagePresenter {
    
    func SuccessLoadingHandle(with people: People) {
        let text: String = "Height: " + (people.height ?? "unknown") + "\nMass: " + (people.mass ?? "unknown") + "\nHair color: " + (people.hair_color ?? "unknown") + "\nSkin color: " + (people.skin_color ?? "unknown") + "\nEye color: " + (people.eye_color ?? "unknown") + "\nBirth year: " + (people.birth_year ?? "unknown") + "\nGender: " + (people.gender ?? "unknown")
        self.delegate?.setText(text: text)
    }
    
    func SuccessLoadingHandle(with film: Film) {
        let text: String = "Episode ID: \(film.episode_id ?? 0) \nOpening crawl: \(film.opening_crawl ?? "unknown") \nDirector: \(film.director ?? "unknown") \nProducer: \(film.producer ?? "unknown") \nRelease date: \(film.release_date ?? "unknown")"
        self.delegate?.setText(text: text)
    }
    
    func SuccessLoadingHandle(with vehicle: Vehicle) {
        let text: String = "Model: \(vehicle.model ?? "unknown") \nManufacturer: \(vehicle.manufacturer ?? "unknown") \nCost in credits: \(vehicle.cost_in_credits ?? "unknown") \nLength: \(vehicle.length ?? "unknown") \nMax atmosphering speed: \(vehicle.max_atmosphering_speed ?? "unknown") \nCrew: \(vehicle.crew ?? "unknown") \nPassengers: \(vehicle.passengers ?? "unknown") \nCargo capacity: \(vehicle.cargo_capacity ?? "unknown") \nConsumables: \(vehicle.consumables ?? "unknown") \nVehicle class: \(vehicle.vehicle_class ?? "unknown")"
        self.delegate?.setText(text: text)
    }
    
    func SuccessLoadingHandle(with starship: Starship) {
        let text: String = "Model: \(starship.model ?? "unknown") \nManufacturer: \(starship.manufacturer ?? "unknown") \nCost in credits: \(starship.cost_in_credits ?? "unknown") \nLength: \(starship.length ?? "unknown") \nMax atmosphering speed: \(starship.max_atmosphering_speed ?? "unknown") \nCrew: \(starship.crew ?? "unknown") \nPassengers: \(starship.passengers ?? "unknown") \nCargo capacity: \(starship.cargo_capacity ?? "unknown") \nConsumables: \(starship.consumables ?? "unknown") \nHyperdrive rating: \(starship.hyperdrive_rating ?? "unknown") \nMGLT: \(starship.mglt ?? "unknown") \nStarship class: \(starship.starship_class ?? "unknown")"
        self.delegate?.setText(text: text)
    }
    
    func SuccessLoadingHandle(with specie: Specie) {
        let text: String = "Classification: \(specie.classification ?? "unknown") \nDesignation: \(specie.designation ?? "unknown") \nAverage height: \(specie.average_height ?? "unknown") \nSkin colors: \(specie.skin_colors ?? "unknown") \nHair colors: \(specie.hair_colors ?? "unknown") \nEye colors: \(specie.eye_colors ?? "unknown") \nAverage lifespan: \(specie.average_lifespan ?? "unknown") \nLanguage: \(specie.language ?? "unknown")"
        self.delegate?.setText(text: text)
    }
    
    func SuccessLoadingHandle(with planet: Planet) {
        let text: String = "Rotation period: \(planet.rotation_period ?? "unknown") \nOrbital period: \(planet.orbital_period ?? "unknown") \nDiameter: \(planet.diameter ?? "unknown") \nClimate: \(planet.climate ?? "unknown") \nGravity: \(planet.gravity ?? "unknown") \nTerrain: \(planet.terrain ?? "unknown") \nSurface water: \(planet.surface_water ?? "unknown") \nPopulation: \(planet.population ?? "unknown")"
        self.delegate?.setText(text: text)
    }
}
