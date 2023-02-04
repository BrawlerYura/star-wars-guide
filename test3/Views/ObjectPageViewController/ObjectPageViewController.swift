//
//  FourthViewController.swift
//  test3
//
//  Created by Admin on 02.02.2023.
//

import UIKit

class ObjectPageViewController: UIViewController, ObjectPagePresenterDelegate {
    
    var contentType = ""
    var objectName = ""
    var objectUrl = ""
    var objectID: Int = 0

    @IBOutlet weak var noImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    private let presenter = ObjectPagePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = objectName
        presenter.setViewDelegate(delegate: self)
        startLoadingObjectDetails(contentType: contentType, objectUrl: objectUrl)
    }
    
    func startLoadingObjectDetails(contentType: String, objectUrl: String) {
        
        self.infoLabel.isHidden = true
        self.objectImage.isHidden = true
        self.noImage.isHidden = true
        self.activityIndicator.startAnimating()
        
        presenter.loadContent(contentType: contentType, objectUrl: objectUrl, objectID: self.objectID)
    }
    
    func setText(text: String) {
        DispatchQueue.main.async {
            self.infoLabel.text = text
            self.infoLabel.adjustsFontForContentSizeCategory = true
            self.infoLabel.adjustsFontSizeToFitWidth = true
            self.nameLabel.adjustsFontForContentSizeCategory = true
            self.nameLabel.adjustsFontSizeToFitWidth = true;
            self.infoLabel.isHidden = false
            self.activityIndicator.stopAnimating()
        }
    }
    
    func setImage(data: Data) {
        DispatchQueue.main.async {
            self.objectImage.image = UIImage(data: data)
            self.objectImage.layer.cornerRadius = 15
            self.objectImage.isHidden = false
            self.noImage.layer.cornerRadius = 15
            self.noImage.isHidden = false
        }
    }
}
