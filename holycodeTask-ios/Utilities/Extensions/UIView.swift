//
//  UIView.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

extension UIView {
    
    static var name: String {
        return String(describing: self)
    }
    
    func setShadow(color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 3
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
    }
}

