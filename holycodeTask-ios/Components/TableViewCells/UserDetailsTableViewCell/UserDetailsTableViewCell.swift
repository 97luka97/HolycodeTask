//
//  UserDetailsTableViewCell.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

protocol UserDetailsTableViewCellDelegate: class {
    func didTapOnEmail()
}

class UserDetailsTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var avatarImage: BorderImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    // MARK: - Properties

    weak var delegate: UserDetailsTableViewCellDelegate?
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Actions

    @objc func emailTapGestureHandler(_ sender: UITapGestureRecognizer) {
        delegate?.didTapOnEmail()
    }
    
    // MARK: - Public methods
    
    func populateData(with user: User) {
        self.nameLabel.text = "\(user.name.title) \(user.name.firstName) \(user.name.lastName)"
        self.ageLabel.text = "\(user.dob.age), \(user.gender)"
        self.emailAddressLabel.text = user.email
        self.avatarImage.setImage(from: user.picture.large, placeholder: UIImage(named: "avatarPlaceholder"))
    }
}


// MARK: - UIStyling methods

extension UserDetailsTableViewCell: UIStyling {
    
    func setupViews() {
        let emailTapGesture = UITapGestureRecognizer(target: self, action: #selector(emailTapGestureHandler(_:)))
        emailAddressLabel.addGestureRecognizer(emailTapGesture)
        emailAddressLabel.isUserInteractionEnabled = true
    }
    
    func setupConstraints() {
        
    }
    
}

