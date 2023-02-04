//
//  ThirdViewController.swift
//  test3
//
//  Created by Admin on 30.01.2023.
//

import UIKit


class ContentPageViewController: UIViewController, ContentPagePresenterDelegate {
    
    
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
    
    private let presenter = ContentPagePresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
        title = contentType
        
        presenter.setViewDelegate(delegate: self)
        
        
        startLoadingContent(contentType: contentType, nextPageUrlString: nil)
        
    }
    
    func startLoadingContent(contentType: String, nextPageUrlString: String?) {
        
        self.activityController.startAnimating()
        self.isLoading = true
        
        presenter.loadContent(contentType: contentType, nextPageUrlString: nextPageUrlString)
    }
    
    func presentContent(content: [ContentCategoryCellModel]) {
        self.categoryContents.append(contentsOf: content)
        
        DispatchQueue.main.async{
            self.activityController.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func setNextPage(nextPage: String) {
        self.nextPage = nextPage
    }
    
    func setLoadingToFalse() {
        self.isLoading = false
    }
    
    func setEndingOfPage() {
        self.isPageEnded = true
        self.nextPage = nil
    }

}
    
    


extension ContentPageViewController: UITableViewDelegate, UITableViewDataSource {
    
        
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
                startLoadingContent(contentType: contentType, nextPageUrlString: self.nextPage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let objectPageViewController = storyboard.instantiateViewController(identifier: "ObjectPageViewController") as? ObjectPageViewController else { return }
        let objectUrl = (categoryContents[indexPath.row].url ?? "") + "?format=json"
        
        objectPageViewController.objectName = categoryContents[indexPath.row].name
        objectPageViewController.objectUrl = objectUrl
        objectPageViewController.contentType = self.contentType
        objectPageViewController.objectID = indexPath.row + 1
        show(objectPageViewController, sender: nil)
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
