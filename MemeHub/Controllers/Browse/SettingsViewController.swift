//
//  SettingsViewController.swift
//  MemeHub
//
//  Created by Jakub "GPH4PPY" Dąbrowski on 04/10/2020.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: Properties
    var tableView: UITableView!
    var userHeader: UserHeader!
    
    private let id = "SettingsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Styling
        tableView.rowHeight = 60
        tableView.backgroundColor = .black
        tableView.tintColor = .white
        
        // Register to SettingsCell.swift and add to the view
        tableView.register(SettingsCell.self, forCellReuseIdentifier: id)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        // Add user's info header
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userHeader = UserHeader(frame: frame)
        tableView.tableHeaderView = userHeader
        
        // Remove unnecesarry separator lines
        tableView.tableFooterView = UIView()
    }
}

// MARK: - TableView Extensions
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingSections(rawValue: section) else { return 0 }
        
        switch section {
        case .Account: return AccountOptions.allCases.count
        case .Application: return ApplicationOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .orange
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        title.text = SettingSections(rawValue: section)?.description
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! SettingsCell
        guard let section = SettingSections(rawValue: indexPath.section) else { return UITableViewCell() }
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        switch section {
        case .Account:
            let account = AccountOptions(rawValue: indexPath.row)
            cell.textLabel?.text = account?.description
        case .Application:
            let application = ApplicationOptions(rawValue: indexPath.row)
            cell.textLabel?.text = application?.description
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingSections(rawValue: indexPath.section) else { return }
        switch section {
        case .Account:
            switch AccountOptions(rawValue: indexPath.row) {
            case .changeEmail:
                // Show AC with field
                // Save the email and upload it on the Firestore DB
                break
            case .changeNickname:
                // Show AC with field
                // Save the nickname and upload it on the Firestore DB
                break
            case .changePassword:
                // Show AC with field
                // Save the password and upload it on the Firestore DB
                break
            case .changeProfilePicture:
                // Show Photo Picker Controller
                // Save the photo and upload it on Firestore DB
                break
            default: break
            }
        case .Application:
            switch ApplicationOptions(rawValue: indexPath.row) {
            case .logout:
                // Logout
                break
            default: break
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
