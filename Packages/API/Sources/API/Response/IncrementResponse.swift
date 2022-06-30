//
//  IncrementResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

public struct IncrementResponse: Decodable {
    public let moneybox: Double
    
    enum CodingKeys: String, CodingKey {
        case moneybox = "Moneybox"
    }
}


