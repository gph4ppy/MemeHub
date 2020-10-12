//
//  RegisterViewController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 01/10/2020.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var fullNameField: UITextField!
    @IBOutlet var nickNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var retypeEmailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var retypePasswordField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    
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
        Styling.styleTextField(fullNameField)
        Styling.styleTextField(nickNameField)
        Styling.styleTextField(emailField)
        Styling.styleTextField(retypeEmailField)
        Styling.styleTextField(passwordField)
        Styling.styleTextField(retypePasswordField)
        Styling.styleButton(registerButton)
    }
    
    /// This function checks all text fields. If they don't match all conditions,, it returns nil. Otherwise it will return error message.
    func checkFields() -> String? {
        // Check if they contain text
        if fullNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            nickNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            retypeEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            retypeEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please, fill all fields above."
        }
        
        // Check if email and retyped email are the same.
        if emailField.text != retypeEmailField.text {
            return "Your email must be the same as retyped one."
        }
        
        // Check if password and retyped password are the same.
        if passwordField.text != retypePasswordField.text {
            return "Your email must be the same as retyped one."
        }
        
        //        // Check if email meets the conditions from the RegEx
        //        let email = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //        if !isEmailValid(email) {
        //            return """
        //                Your email is inavlid.
        //                Make sure that you typed it properly.
        //                """
        //        }
        
        // Check if password meets the conditions from the RegEx
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !isPasswordValid(password) {
            return """
                Your password is not strong enough.
                Make sure that it has at least 6 characters,
                contains a special symbol and a number.
                """
        }
        
        return nil
    }
    
    func showErrorMessage(_ error: String) {
        errorLabel.isHidden = false
        errorLabel.text = error
    }
    
    //    // Email Validation
    //    func isEmailValid(_ email: String) -> Bool {
    //        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    //        return emailTest.evaluate(with: email)
    //    }
    
    // Password Validation
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
        return passwordTest.evaluate(with: password)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let error = checkFields()
        
        // Check all text fields
        if error != nil {
            // If sth is wrong, print error to the user
            showErrorMessage(error!)
        } else {
            // Otherwise create new user
            createNewUser()
        }
    }
    
    /// This method creates new user and sends the data to Firestore Database
    func createNewUser() {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        // Create safe versions of data
        let fullName = fullNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let nickname = nickNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let safeEmail = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let safePassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let imageName = "person.circle"
        
        Auth.auth().createUser(withEmail: safeEmail, password: safePassword) { (result, error) in
            // Check for errors
            if error != nil {
                // if ocurred, then print it in console and show user error message
                print(error!)
                self.showErrorMessage("Error with creating new user. Contact with the support.")
            } else {
                // otherwise store user data, cause it has been created
                ref = db.collection("users").addDocument(data: [
                    "full_name": fullName,
                    "nickname": nickname,
                    "image_name": imageName,
                    "uid": result!.user.uid
                ]) { (err) in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
                // Take me to the home page
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
