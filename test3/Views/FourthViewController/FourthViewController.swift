//
//  FourthViewController.swift
//  test3
//
//  Created by Admin on 02.02.2023.
//

import UIKit

class FourthViewController: UIViewController {
    
    var contentType = ""
    var objectName = ""
    var objectUrl = ""
    var objectID: Int = 0

    @IBOutlet weak var noImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadContent(contentType: contentType, objectUrl: objectUrl)
        nameLabel.text = objectName
    }
}


private extension FourthViewController {
    
    func loadContent(contentType: String , objectUrl: String)  {
        infoLabel.isHidden = true
        self.objectImage.isHidden = true
        self.noImage.isHidden = true
        activityIndicator.startAnimating()
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
    }
    
    
    
    func SuccessLoadingHandle(with people: People) {
        DispatchQueue.main.async{
            let text: String = "Height: " + (people.height ?? "unknown") + "\nMass: " + (people.mass ?? "unknown") + "\nHair color: " + (people.hair_color ?? "unknown") + "\nSkin color: " + (people.skin_color ?? "unknown") + "\nEye color: " + (people.eye_color ?? "unknown") + "\nBirth year: " + (people.birth_year ?? "unknown") + "\nGender: " + (people.gender ?? "unknown")
            if self.objectID >= 17{
                self.objectID += 1
            }
            self.appendObjectDetails(text: text)
        }
        
    }
    
    func SuccessLoadingHandle(with film: Film) {
        DispatchQueue.main.async{
            let text: String = "Episode ID: \(film.episode_id ?? 0) \nOpening crawl: \(film.opening_crawl ?? "unknown") \nDirector: \(film.director ?? "unknown") \nProducer: \(film.producer ?? "unknown") \nRelease date: \(film.release_date ?? "unknown")"
            self.appendObjectDetails(text: text)
        }
        
    }
    
    func SuccessLoadingHandle(with vehicle: Vehicle) {
        DispatchQueue.main.async{
            let text: String = "Model: \(vehicle.model ?? "unknown") \nManufacturer: \(vehicle.manufacturer ?? "unknown") \nCost in credits: \(vehicle.cost_in_credits ?? "unknown") \nLength: \(vehicle.length ?? "unknown") \nMax atmosphering speed: \(vehicle.max_atmosphering_speed ?? "unknown") \nCrew: \(vehicle.crew ?? "unknown") \nPassengers: \(vehicle.passengers ?? "unknown") \nCargo capacity: \(vehicle.cargo_capacity ?? "unknown") \nConsumables: \(vehicle.consumables ?? "unknown") \nVehicle class: \(vehicle.vehicle_class ?? "unknown")"
            self.objectID += 4
            self.appendObjectDetails(text: text)
        }
    }
    
    func SuccessLoadingHandle(with starship: Starship) {
        DispatchQueue.main.async{
            let text: String = "Model: \(starship.model ?? "unknown") \nManufacturer: \(starship.manufacturer ?? "unknown") \nCost in credits: \(starship.cost_in_credits ?? "unknown") \nLength: \(starship.length ?? "unknown") \nMax atmosphering speed: \(starship.max_atmosphering_speed ?? "unknown") \nCrew: \(starship.crew ?? "unknown") \nPassengers: \(starship.passengers ?? "unknown") \nCargo capacity: \(starship.cargo_capacity ?? "unknown") \nConsumables: \(starship.consumables ?? "unknown") \nHyperdrive rating: \(starship.hyperdrive_rating ?? "unknown") \nMGLT: \(starship.mglt ?? "unknown") \nStarship class: \(starship.starship_class ?? "unknown")"
            self.objectID += 7
            self.appendObjectDetails(text: text)
        }
    }
    
    func SuccessLoadingHandle(with specie: Specie) {
        DispatchQueue.main.async{
            let text: String = "Classification: \(specie.classification ?? "unknown") \nDesignation: \(specie.designation ?? "unknown") \nAverage height: \(specie.average_height ?? "unknown") \nSkin colors: \(specie.skin_colors ?? "unknown") \nHair colors: \(specie.hair_colors ?? "unknown") \nEye colors: \(specie.eye_colors ?? "unknown") \nAverage lifespan: \(specie.average_lifespan ?? "unknown") \nLanguage: \(specie.language ?? "unknown")"
            self.appendObjectDetails(text: text)
        }
    }
    
    func SuccessLoadingHandle(with planet: Planet) {
        DispatchQueue.main.async{
            let text: String = "Rotation period: \(planet.rotation_period ?? "unknown") \nOrbital period: \(planet.orbital_period ?? "unknown") \nDiameter: \(planet.diameter ?? "unknown") \nClimate: \(planet.climate ?? "unknown") \nGravity: \(planet.gravity ?? "unknown") \nTerrain: \(planet.terrain ?? "unknown") \nSurface water: \(planet.surface_water ?? "unknown") \nPopulation: \(planet.population ?? "unknown")"
            self.appendObjectDetails(text: text)
        }
    }
    
    func SuccessLoadingHandle(with data: Data) {
        DispatchQueue.main.async{
            self.objectImage.image = UIImage(data: data)
            self.objectImage.layer.cornerRadius = 15
            self.objectImage.isHidden = false
            self.noImage.layer.cornerRadius = 15
            self.noImage.isHidden = false
        }
    }
    
    func appendObjectDetails(text: String) {
        ApiManager.shared.getObjectImage(imageID: self.objectID, contentType: self.contentType) { data, response, error in
            guard let data = data, error == nil else { return }
            self.SuccessLoadingHandle(with: data)
        }
        
        self.infoLabel.text = text
        self.infoLabel.adjustsFontForContentSizeCategory = true
        self.infoLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.adjustsFontForContentSizeCategory = true
        self.nameLabel.adjustsFontSizeToFitWidth = true;
        self.infoLabel.isHidden = false
        self.activityIndicator.stopAnimating()
    }
    
}
