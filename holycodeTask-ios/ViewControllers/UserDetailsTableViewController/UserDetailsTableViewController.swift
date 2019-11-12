//
//  UserDetailsTableViewController.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit
import MessageUI

class UserDetailsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var user: User!
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupViews()
    }
    
    // MARK: - Private methods
    
    private func registerCell() {
        tableView.register(UINib(nibName: UserDetailsTableViewCell.name, bundle: nil), forCellReuseIdentifier: UserDetailsTableViewCell.name)
    }
    
    fileprivate func openMailComposer() {
        guard MFMailComposeViewController.canSendMail() else { return }
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([user.email])
        self.present(mail, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate methods

extension UserDetailsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.name, for: indexPath) as? UserDetailsTableViewCell else {
            fatalError("Cell doesn't exist")
        }
        cell.delegate = self
        cell.populateData(with: user)
        return cell
    }
    
}

// MARK: - UIStyling methods

extension UserDetailsTableViewController: UIStyling {
    
    func setupViews() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 310
        tableView.separatorStyle = .none
        
        navigationItem.title = "\(user.name.firstName) \(user.name.lastName)"
    }
    
    func setupConstraints() {
        
    }
    
}

// MARK: - UserDetailsTableViewCellDelegate methods

extension UserDetailsTableViewController: UserDetailsTableViewCellDelegate {
    
    func didTapOnEmail() {
        openMailComposer()
    }
    
}

// MARK: - MFMailComposeViewControllerDelegate, UINavigationControllerDelegate methods

extension UserDetailsTableViewController: MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}
