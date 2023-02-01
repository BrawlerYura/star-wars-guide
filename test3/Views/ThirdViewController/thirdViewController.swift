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
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.register(UINib(nibName: "PostContentCell", bundle: nil), forCellReuseIdentifier: "PostContentCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
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
            ApiManager.shared.getFilms { result in
                switch  result{
                case .success(let films):
                    print(films)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
        case "Vehicles":
            ApiManager.shared.getVehicles { result in
                switch  result{
                case .success(let vehicles):
                    print(vehicles)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
        case "Species":
            ApiManager.shared.getSpecies { result in
                switch  result{
                case .success(let species):
                    print(species)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
        case "Starships":
            ApiManager.shared.getStarships { result in
                switch  result{
                case .success(let starships):
                    print(starships)
                    self.isLoading = false
                case .failure(let error):
                    print(error)
                    self.isLoading = false
                }
            }
        case "Planets":
            ApiManager.shared.getPlanets { result in
                switch  result{
                case .success(let planets):
                    print(planets)
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
        self.categoryContents.append(contentsOf: categoryContents)
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
}


