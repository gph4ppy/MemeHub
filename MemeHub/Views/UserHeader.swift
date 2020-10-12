//
//  UserHeader.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 08/10/2020.
//

import UIKit

class UserHeader: UIView {
    
    // MARK: Properties
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "AppIcon")
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@HappyPlayGames"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jakub Dąbrowski"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .quaternaryLabel
        
        let profileImageDimension: CGFloat = 60
        
        addSubview(profileImage)
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImage.layer.cornerRadius = profileImageDimension / 2
        
        addSubview(usernameLabel)
        usernameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: -10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 12).isActive = true
        
        addSubview(fullNameLabel)
        fullNameLabel.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor, constant: 10).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
