//
//  RoundedShadowView.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

/// This is another approach i use for getting some default configuration. Not that flexible but fast.
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

