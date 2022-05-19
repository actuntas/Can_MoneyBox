//
//  MoneyboxCircle.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct MoneyboxCircle: Codable {
    let state: String
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
    }
}
