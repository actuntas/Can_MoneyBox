//
//  Personalisation.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Personalisation: Codable {
    let quickAddDeposit: QuickAddDeposit
    let hideAccounts: HideAccounts
    
    enum CodingKeys: String, CodingKey {
        case quickAddDeposit = "QuickAddDeposit"
        case hideAccounts = "HideAccounts"
    }
}
