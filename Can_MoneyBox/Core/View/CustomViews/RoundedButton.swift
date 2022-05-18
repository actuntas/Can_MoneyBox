//
//  RoundedButton.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import UIKit

/// I'm gonna make this nondesignable in order to show programmatic layout skills and i will be able to use iOS 15's newish configuration API.
///
class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.setTitleColor(.purple, for: .normal)
        self.setTitleColor(.lightGray, for: .disabled)
    }
    
    private func configure() {
        layer.cornerRadius = 25
        layer.borderColor = UIColor.purple.cgColor
        layer.borderWidth = 2
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

