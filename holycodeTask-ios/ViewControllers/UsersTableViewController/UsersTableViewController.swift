//
//  UsersTableViewController.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupViews()
    }
    
    // MARK: - Private methods
    
    private func registerCell() {
        tableView.register(UINib(nibName: BasicUserDetailsTableViewCell.name, bundle: nil), forCellReuseIdentifier: BasicUserDetailsTableViewCell.name)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate methods

extension UsersTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicUserDetailsTableViewCell.name, for: indexPath) as? BasicUserDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UIStyling methods

extension UsersTableViewController: UIStyling {
    
    func setupViews() {
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .black
        tableView.rowHeight = 124
    }
    
    func setupConstraints() {
        
    }
    
}

