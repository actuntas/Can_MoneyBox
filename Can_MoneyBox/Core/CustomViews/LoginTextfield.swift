//
//  LoginTextField.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

class LoginTextfield: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 8 { didSet { self.layer.cornerRadius = cornerRadius }}
    @IBInspectable var bgColor: UIColor = .clear { didSet { self.backgroundColor = bgColor }}
    @IBInspectable var borderColor: UIColor = UIColor.clear { didSet { self.layer.borderColor = borderColor.cgColor }}
    @IBInspectable var borderWidth: CGFloat = 1 { didSet { self.layer.borderWidth = borderWidth }}
    @IBInspectable var borderColorAct: UIColor = UIColor.white
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inits()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        inits()
    }
    
    private func inits() {
        self.addTarget(self, action: #selector(activate), for: .editingDidBegin)
        self.addTarget(self, action: #selector(deactivate), for: .editingDidEnd)
        self.tintColor = .white
    }
    
    @objc func activate() {
        self.layer.borderColor = borderColorAct.cgColor
        self.layer.borderWidth = (borderWidth * 2).rounded()
        
    }
    
    @objc func deactivate() {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = (borderWidth / 2).rounded()
        
    }
}
