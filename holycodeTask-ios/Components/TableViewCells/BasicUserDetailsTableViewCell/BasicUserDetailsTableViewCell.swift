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
    
    @IBOutlet weak var gradientContentView: GradientView!
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
        self.avatarImage.kf.setImage(with: user.picture.medium, placeholder: UIImage(named: "avatarPlaceholder"))
        self.flagImage.kf.setImage(with: URL(string: BaseURL.flag.rawValue + APIPath.getFlag(user.nat, size: 32).path))
        self.gradientContentView.startColor = user.gender == "male" ? UIColor.startMaleColor : UIColor.startFemaleColor
        self.gradientContentView.endColor = user.gender == "male" ? UIColor.endMaleColor : UIColor.endFemaleColor
    }
}

// MARK: - UIStyling methods

extension BasicUserDetailsTableViewCell: UIStyling {
    
    func setupViews() {
        avatarImage.image = nil
        flagImage.image = nil
        gradientContentView.setShadow(color: .black)
        gradientContentView.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        
    }
    
}

