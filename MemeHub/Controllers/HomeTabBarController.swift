//
//  HomeTabBarController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 01/10/2020.
//

import UIKit

class HomeTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Makes the status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
