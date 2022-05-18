//
//  String + Ext.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 17.05.2022.
//

import Foundation

public extension String {
    
    var isEmail:Bool {
        if self.isEmpty {
            return false
        }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailTest.evaluate(with: self)
    }
    
    var isSecurePassword: Bool {
        if self.isEmpty {
            return false
        }
        return self.count > 5
    }
}
