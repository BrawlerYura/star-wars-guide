//
//  secViewController.swift
//  test3
//
//  Created by Admin on 29.01.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    
    
    private var icons: [ContentIcons] = []
    private let presenter = MainPagePresenter()
    weak private var outputDelegate: MainPageOutputDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setMainPageIputDelegate(mainPageInputDlegate: self)
        
        self.outputDelegate = presenter
        self.outputDelegate?.getIcons()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let contentPageViewController = storyboard.instantiateViewController(identifier: "ContentPageViewController") as? ContentPageViewController else { return }
                contentPageViewController.contentType = icons[indexPath.row].titles
        show(contentPageViewController, sender: nil)
    }
    
}

extension MainPageViewController: MainPageInputDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupContent(with icons: ([ContentIcons])) {
        self.icons = icons
    }
    
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.image.image = UIImage(named: icons[indexPath.row].images)
        cell.title.text = icons[indexPath.row].titles
        cell.title.layer.cornerRadius = 20
        cell.title.layer.backgroundColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        return cell
    }
        
    
    
    
}


class PostCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        title.layer.cornerRadius = 20
        image.layer.cornerRadius = 20
        background.layer.cornerRadius = 20
    }
}



    
