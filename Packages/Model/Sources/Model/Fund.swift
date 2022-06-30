//
//  Fund.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Fund: Codable {
    let fundID: Int
    let name: String
    let logoURL: String?
    let isFundDMB: Bool
    
    enum CodingKeys: String, CodingKey {
        case fundID = "FundId"
        case name = "Name"
        case logoURL = "LogoUrl"
        case isFundDMB = "IsFundDMB"
    }
}
