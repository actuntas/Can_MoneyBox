//
//  Wrapper.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Wrapper: Codable {
    let id, definitionGlobalID: String
    let totalValue: Double
    let totalContributions: Int
    let earningsNet, earningsAsPercentage: Double
    let returns: Returns
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case definitionGlobalID = "DefinitionGlobalId"
        case totalValue = "TotalValue"
        case totalContributions = "TotalContributions"
        case earningsNet = "EarningsNet"
        case earningsAsPercentage = "EarningsAsPercentage"
        case returns = "Returns"
    }
}
