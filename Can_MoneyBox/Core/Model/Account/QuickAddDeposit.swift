//
//  QuickAddDeposit.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct QuickAddDeposit: Codable {
    let amount: Int
    
    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
    }
}
