//
//  BasicUserDetailsTableViewCell.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit
import Kingfisher

class BasicUserDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var flagImage: UIImageView!
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Public methods
    
    func populateData(with user: User) {
        self.nameLabel.text = "Name: \(user.name.firstName) \(user.name.lastName)"
        self.ageLabel.text = "Age: \(user.dob.age)"
        self.avatarImage.setImage(from: user.picture.medium, placeholder: UIImage(named: "avatarPlaceholder"))
        self.flagImage.setImage(from: BaseURL.flag.rawValue + APIPath.getFlag(user.nat, size: 32).path, placeholder: nil)
    }
}

// MARK: - UIStyling methods

extension BasicUserDetailsTableViewCell: UIStyling {
    
    func setupViews() {
        avatarImage.image = nil
        flagImage.image = nil
    }
    
    func setupConstraints() {
        
    }
    
}

