//
//  WelcomeViewController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 01/10/2020.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling
        setupStyling()
        
        // Swipe Back Gesture
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    // Makes the status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupStyling() {
        Styling.styleButton(loginButton)
        Styling.styleHollowButton(registerButton)
    }
}

// MARK: - Extensions
extension WelcomeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
