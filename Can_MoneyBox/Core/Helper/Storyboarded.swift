//
//  Storyboarded.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 22.05.2022.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
