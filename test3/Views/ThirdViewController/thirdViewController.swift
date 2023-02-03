//
//  ThirdViewController.swift
//  test3
//
//  Created by Admin on 30.01.2023.
//

import UIKit


class thirdViewController: UIViewController {
    
    private enum Metrics {
        static let cellHeight: CGFloat = 65
    }
    
    private var categoryContents: [ContentCategoryCellModel] = []
    private var nextPage: String?
    private var isLoading: Bool = false
    private var isPageEnded: Bool = false
    var contentType: String = ""
    
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        title = contentType
        
        loadContent(contentType: contentType, nextPageUrlString: nil)
        
    }
    
}
    
    


extension thirdViewController: UITableViewDelegate, UITableViewDataSource {
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostContentCell", for: indexPath) as? PostContentCell else { return UITableViewCell() }
        cell.configure(with: categoryContents[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height + Metrics.cellHeight) > scrollView.contentSize.height) {
            if self.isLoading == false,
               self.isPageEnded == false {
                self.loadContent(contentType: contentType, nextPageUrlString: self.nextPage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let fourthViewController = storyboard.instantiateViewController(identifier: "FourthViewController") as? FourthViewController else { return }
        var objectUrl = categoryContents[indexPath.row].url ?? ""
        
        fourthViewController.objectName = categoryContents[indexPath.row].name
        fourthViewController.objectUrl = objectUrl + "?format=json"
        fourthViewController.contentType = self.contentType
        fourthViewController.objectID = indexPath.row + 1
        show(fourthViewController, sender: nil)
    }
    
    
    
}

class PostContentCell: UITableViewCell {
    
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        backgroundCellView.layer.cornerRadius = 25
        backgroundCellView.layer.masksToBounds = true
    }
    
    func configure(with model: ContentCategoryCellModel) {
        self.contentLabel.text = model.name
    }
}


private extension thirdViewController {
    
    func loadContent(contentType: String , nextPageUrlString: String?)  {
        self.activityController.startAnimating()
        self.isLoading = true
        
        switch contentType {
            
        case "Characters":
            ApiManager.shared.getPeoples(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let peoples):
                    self.charactersSuccessLoadingHandle(with: peoples)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        case "Films":
            ApiManager.shared.getFilms(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let films):
                    self.charactersSuccessLoadingHandle(with: films)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        case "Vehicles":
            ApiManager.shared.getVehicles(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let vehicles):
                    self.charactersSuccessLoadingHandle(with: vehicles)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        case "Species":
            ApiManager.shared.getSpecies(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let species):
                    self.charactersSuccessLoadingHandle(with: species)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        case "Starships":
            ApiManager.shared.getStarships(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let starships):
                    self.charactersSuccessLoadingHandle(with: starships)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        case "Planets":
            ApiManager.shared.getPlanets(nextPageUrlString: nextPageUrlString) { result in
                switch  result{
                case .success(let planets):
                    self.charactersSuccessLoadingHandle(with: planets)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
            
        default:
            print("no results")
        }
    }
    
    
    
    func charactersSuccessLoadingHandle(with peoples: Peoples) {
        if let nextPage = peoples.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = peoples.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with films: Films) {
        if let nextPage = films.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = films.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.title ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with vehicles: Vehicles) {
        if let nextPage = vehicles.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = vehicles.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with starships: Starships) {
        if let nextPage = starships.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = starships.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with species: Species) {
        if let nextPage = species.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = species.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    func charactersSuccessLoadingHandle(with planets: Planets) {
        if let nextPage = planets.next {
            self.nextPage = nextPage
        } else {
            self.isPageEnded = true
            self.nextPage = nil
        }
        
        guard let results = planets.results else { return }
        let categoryContents = results.map { ContentCategoryCellModel(url: $0.url , name: $0.name ?? "") }
        appendCategoryContents(categoryContents: categoryContents)
    }
    
    
    
    func appendCategoryContents(categoryContents: [ContentCategoryCellModel]) {
        self.categoryContents.append(contentsOf: categoryContents)
        
        DispatchQueue.main.async{
            self.activityController.stopAnimating()
            self.tableView.reloadData()
        }
    }
}


