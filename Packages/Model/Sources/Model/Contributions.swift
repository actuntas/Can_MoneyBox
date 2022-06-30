//
//  Contributions.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Contributions: Codable {
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
    }
}
