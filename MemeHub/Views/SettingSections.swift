//
//  SettingSections.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 09/10/2020.
//

import Foundation
import UIKit

// MARK: Settings
enum SettingSections: Int, CaseIterable, CustomStringConvertible {
    case Account
    case Application
    
    var description: String {
        switch self {
        case .Account: return "Account"
        case .Application: return "Application"
        }
    }
}

enum AccountOptions: Int, CaseIterable, CustomStringConvertible {
    case changeEmail
    case changeNickname
    case changePassword
    case changeProfilePicture
    
    var description: String {
        switch self {
        case .changeEmail: return "Edit Email"
        case .changeNickname: return "Edit Nickname"
        case .changePassword: return "Change Password"
        case .changeProfilePicture: return "Change Profile Picture"
        }
    }
}

enum ApplicationOptions: Int, CaseIterable, CustomStringConvertible {
    case logout
    
    var description: String {
        switch self {
        case .logout: return "Sign Out"
        }
    }
}

// MARK: Profile
enum ProfileSections: Int, CaseIterable, CustomStringConvertible {
    case Header
    case Gallery
    
    var description: String {
        switch self {
        case .Header: return "Header"
        case .Gallery: return "Gallery"
        }
    }
}
