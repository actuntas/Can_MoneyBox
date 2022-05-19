//
//  Returns.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Returns: Codable {
    let simple, lifetime, annualised: Double
    
    enum CodingKeys: String, CodingKey {
        case simple = "Simple"
        case lifetime = "Lifetime"
        case annualised = "Annualised"
    }
}
