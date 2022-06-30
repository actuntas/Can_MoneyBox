//
//  Account.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Account: Codable {
    let type, name, deepLinkIdentifier: String
    let wrapper: Wrapper
    let milestone: Milestone
    let hasCollections: Bool
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case name = "Name"
        case deepLinkIdentifier = "DeepLinkIdentifier"
        case wrapper = "Wrapper"
        case milestone = "Milestone"
        case hasCollections = "HasCollections"
    }
}
