//
//  tealViewController.swift
//  test3
//
//  Created by Admin on 29.01.2023.
//

import UIKit

class firViewController: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.tintColor = UIColor.clear
        button.layer.cornerRadius =  15
        
        
        ApiManager.shared.getPeople { planets in
            
        }
        ApiManager.shared.getSpecies { planets in
            
        }
       
        ApiManager.shared.getStarships { planets in
            
        }
    }
    
}
