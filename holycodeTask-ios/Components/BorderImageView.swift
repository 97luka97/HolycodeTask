//
//  BorderImageView.swift
//  holycodeTask-ios
//
//  Created by Kostic on 11/11/19.
//  Copyright © 2019 Kostic. All rights reserved.
//

import UIKit

@IBDesignable class BorderImageView: UIImageView {
    
    // MARK: - Inspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.roundCorners(radius: cornerRadius)
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.setBorderColor(color: borderColor)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.setBorderWidth(width: borderWidth)
        }
    }
    
    // MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override class func prepareForInterfaceBuilder() {

    }
    
    // MARK: - Custom methods

    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func setBorderColor(color: UIColor) {
        layer.borderColor = color.cgColor
    }
    
    func setBorderWidth(width: CGFloat) {
        layer.borderWidth = width
    }
}
