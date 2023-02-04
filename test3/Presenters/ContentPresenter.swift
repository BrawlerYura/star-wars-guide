//
//  thirdPresenter.swift
//  test3
//
//  Created by Admin on 01.02.2023.
//

import Foundation

protocol ContentPresenterDelegate: AnyObject {
    func presentContent(content: [ContentCategoryCellModel])
    func setNextPage(nextPage: String)
    func setLoadingToFalse()
    func setEndingOfPage()
}

class ContentPresenter {
    
    weak var delegate: ContentPresenterDelegate?
    
    public func loadContent(contentType: String , nextPageUrlString: String?) {
        
        switch contentType {
            
        case "Characters":
            ApiManager.shared.getPeoples(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let peoples):
                    self.charactersSuccessLoadingHandle(with: peoples)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        case "Films":
            ApiManager.shared.getFilms(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let films):
                    self.charactersSuccessLoadingHandle(with: films)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        case "Vehicles":
            ApiManager.shared.getVehicles(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let vehicles):
                    self.charactersSuccessLoadingHandle(with: vehicles)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        case "Species":
            ApiManager.shared.getSpecies(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let species):
                    self.charactersSuccessLoadingHandle(with: species)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        case "Starships":
            ApiManager.shared.getStarships(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let starships):
                    self.charactersSuccessLoadingHandle(with: starships)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        case "Planets":
            ApiManager.shared.getPlanets(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let planets):
                    self.charactersSuccessLoadingHandle(with: planets)
                    self.delegate?.setLoadingToFalse()
                case .failure(let error):
                    print(error)
                    self.delegate?.setLoadingToFalse()
                }
            }
            
        default:
            print("no results")
        }
    }
    
    public func setViewDelegate(delegate: ContentPresenterDelegate) {
        self.delegate = delegate
    }
}

private extension ContentPresenter {
    
    func charactersSuccessLoadingHandle(with peoples: Peoples) {
        if let nextPage = peoples.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = peoples.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with films: Films) {
        if let nextPage = films.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = films.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.title ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with vehicles: Vehicles) {
        if let nextPage = vehicles.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = vehicles.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with starships: Starships) {
        if let nextPage = starships.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = starships.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with species: Species) {
        if let nextPage = species.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = species.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with planets: Planets) {
        if let nextPage = planets.next {
            self.delegate?.setNextPage(nextPage: nextPage)
        } else {
            self.delegate?.setEndingOfPage()
        }
        
        guard let results = planets.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        self.delegate?.presentContent(content: categoryContents)
    }
}
