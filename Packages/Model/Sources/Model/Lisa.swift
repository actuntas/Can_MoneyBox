//
//  Lisa.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Lisa: Codable {
    let maximumBonus: Int
    
    enum CodingKeys: String, CodingKey {
        case maximumBonus = "MaximumBonus"
    }
}
