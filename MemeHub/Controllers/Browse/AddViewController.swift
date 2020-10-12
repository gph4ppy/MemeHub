//
//  AddViewController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 04/10/2020.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var hashtagField: UITextField!
    
    // Properties
    var hashtags = [String]()
    var wordCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling
        Styling.styleTextField(hashtagField)
        
        hashtagField.delegate = self
    }
    
    @IBAction func uploadButtonTapped(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info [.editedImage] as? UIImage else { return }
        imageView.image = image
        dismiss(animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        // MARK: - NOT WORKING!!!!
        guard let tags = hashtagField.text else { return }
        let initialTags = tags.components(separatedBy: ", ")
        
        checkTagCount()
        
        // Check if user typed 3 hashtags
        if wordCount == 3 {
            // If yes, then add them to the main tags arr and add before them hash symbol
            for tag in initialTags {
                hashtags.append("#\(tag)")
            }
            // Share photo
            print("No tags: \(wordCount) | Tags: \(hashtags)")
            sharePhoto()
        } else {
            // Otherwise show alert that user must type 3 tags
            let ac = UIAlertController(title: "3 tags!", message: "You need to type EXACTLY 3 hashtags - no less, no more.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK, SORRY!", style: .cancel))
        }
    }
    
    func sharePhoto() {
        // Generate UUID for a photo
        
        // Upload it with hashtags to the Firestore Database
        
        // Inform user about it by AC
    }
}

extension AddViewController: UITextFieldDelegate {
    func checkTagCount() {
        guard let tags = hashtagField.text else { return }
        wordCount = tags.components(separatedBy: "").count
    }
}
