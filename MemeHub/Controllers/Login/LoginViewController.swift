//
//  LoginViewController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 01/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
    }
    
    // Makes the status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // Styling
    func setupStyling() {
        errorLabel.isHidden = true
        Styling.styleTextField(emailField)
        Styling.styleTextField(passwordField)
        Styling.styleButton(loginButton)
    }
    
    /// This function checks all text fields. If they don't match all conditions,, it returns nil. Otherwise it will return error message.
    func checkFields() -> String? {
        // Check if they contain text
        if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please, fill in email field."
        } else if passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please, fill in password field."
        }
        return nil
    }
    
    func showErrorMessage(_ error: String) {
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let error = checkFields()
        
        // Check all text fields
        if error != nil {
            // If sth is wrong, print error to the user
            showErrorMessage(error!)
        } else {
            // Otherwise sign the user in
            signIn()
        }
    }
    
    /// This method checks data from textfields and looks if they exist in Firestore Database
    func signIn() {
        // Create safe versions of data
        let safeEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let safePassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: safeEmail, password: safePassword) { (result, error) in
            // Check for errors
            if error != nil {
                // if ocurred, then print it in console and show user error message
                print(error!)
                let detailedError = error!.localizedDescription
                self.showErrorMessage(detailedError)
            } else {
                // Yes, we found that user - show him the home screen!
                self.showHomePage()
            }
        }
    }
    
    func showHomePage() {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "Home") as! HomeTabBarController
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
}
