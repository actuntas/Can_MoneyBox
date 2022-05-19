//
//  HideAccounts.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct HideAccounts: Codable {
    let enabled, isHidden: Bool
    let sequence: Int
    
    enum CodingKeys: String, CodingKey {
        case enabled = "Enabled"
        case isHidden = "IsHidden"
        case sequence = "Sequence"
    }
}
