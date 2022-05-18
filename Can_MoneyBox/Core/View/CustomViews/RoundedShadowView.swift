//
//  RoundedShadowView.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

/// change this
public class RoundedShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 8 { didSet { self.layer.cornerRadius = cornerRadius }}
    @IBInspectable var bgColor: UIColor = .red { didSet { self.backgroundColor = bgColor }}
    @IBInspectable var borderColor: UIColor = UIColor.white { didSet { self.layer.borderColor = borderColor.cgColor }}
    @IBInspectable var borderWidth: CGFloat = 1 { didSet { self.layer.borderWidth = borderWidth }}
    @IBInspectable var shadowOpacity: Float = 0.4 { didSet { self.layer.shadowOpacity = shadowOpacity }}
    @IBInspectable var shadowRadius: CGFloat = 4 { didSet { self.layer.shadowRadius = shadowRadius }}
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 1) { didSet { self.layer.shadowOffset = shadowOffset }}
    
}

