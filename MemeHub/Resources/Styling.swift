//
//  Styling.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 01/10/2020.
//

import Foundation
import UIKit

class Styling {
    /// This method removes border and adds bottom line
    static func styleTextField(_ textfield: UITextField) {
        // Add Bottom Line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.size.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.orange.cgColor
        // Border Style
        textfield.borderStyle = .none
        textfield.layer.masksToBounds = true
        textfield.tintColor = .white
        // Add Sublayer
        textfield.layer.addSublayer(bottomLine)
        // Change Placeholder Color
        if let placeholder = textfield.placeholder {
            textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange])
        }
    }
    
    /// This method fills button with nice color, sets font color to white and rounds corners
    static func styleButton(_ button: UIButton) {
        button.backgroundColor = .orange
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 22.0
        button.tintColor = .white
        
    }
    
    /// This method gives the button  colored border and rounds corners
    static func styleHollowButton(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 22.0
        button.tintColor = .orange
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 2
    }
}
