//
//  AccountResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct AccountResponse: Codable {
    
    let moneyboxEndOfTaxYear: String
    let totalPlanValue, totalEarnings, totalContributionsNet, totalEarningsAsPercentage: Double
    let productResponses: [ProductResponse]
    let accounts: [Account]

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

