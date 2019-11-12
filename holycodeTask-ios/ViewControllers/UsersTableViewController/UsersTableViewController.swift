//
//  UsersTableViewController.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    // MARK: - Computed properties
    
    fileprivate var users = [User]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    fileprivate var page: Int = 1 {
        didSet {
            self.getUsers(page: page)
        }
    }
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getUsers()
        setupViews()
    }
    
    // MARK: - Private methods
    
    private func registerCell() {
        tableView.register(UINib(nibName: BasicUserDetailsTableViewCell.name, bundle: nil), forCellReuseIdentifier: BasicUserDetailsTableViewCell.name)
    }
    
    private func getUsers(page: Int = 1) {
        UsersRepository().loadFromAPI(page: page) { [weak self] (users, error) in
            self?.users.append(contentsOf: users)
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate methods

extension UsersTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicUserDetailsTableViewCell.name, for: indexPath) as? BasicUserDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.populateData(with: users[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailsCoordinator = UserDetailsCoordinator.init(navigationController: self.navigationController, source: self, user: users[indexPath.row])
        userDetailsCoordinator.start()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == users.count { // Table view will display last cell
            page += 1
        }
    }
}

// MARK: - UIStyling methods

extension UsersTableViewController: UIStyling {
    
    func setupViews() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.rowHeight = 124
        
        navigationItem.title = "Users"
    }
    
    func setupConstraints() {
        
    }
    
}

