//
//  AccountResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation
import Model

public struct AccountResponse: Codable {
    
    public let moneyboxEndOfTaxYear: String
    public let totalPlanValue, totalEarnings, totalContributionsNet, totalEarningsAsPercentage: Double
    public let productResponses: [ProductResponse]
    public let accounts: [Account]

    enum CodingKeys: String, CodingKey {
        case moneyboxEndOfTaxYear = "MoneyboxEndOfTaxYear"
        case totalPlanValue = "TotalPlanValue"
        case totalEarnings = "TotalEarnings"
        case totalContributionsNet = "TotalContributionsNet"
        case totalEarningsAsPercentage = "TotalEarningsAsPercentage"
        case productResponses = "ProductResponses"
        case accounts = "Accounts"
    }
}

