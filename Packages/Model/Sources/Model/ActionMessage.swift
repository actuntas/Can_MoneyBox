//
//  ActionMessage.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct ActionMessage: Codable {
    let type, message: String
    let actions: [Action]
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case message = "Message"
        case actions = "Actions"
    }
}
