//
//  RoundedShadowView.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

/// change this
class RoundedShadowView: UIView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.purple.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 1, height: 1)
        clipsToBounds = false
        backgroundColor = .red
    }
}

