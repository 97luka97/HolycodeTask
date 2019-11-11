//
//  UIImageView.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(from urlString: String, placeholder: UIImage?) {
        guard let url = URL(string: urlString) else {
            return
        }
        self.kf.setImage(with: url, placeholder: placeholder)
    }
}

