//
//  Action.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Action: Codable {
    let label: String
    let amount: Int
    let type, animation: String
    
    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case amount = "Amount"
        case type = "Type"
        case animation = "Animation"
    }
}
