//
//  Product.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Product: Codable {
    let id: Int
    let globalID, name, categoryType, type: String
    let friendlyName: String
    let canWithdraw: Bool
    let productHexCode: String?
    let annualLimit, depositLimit: Int
    let bonusMultiplier: Double
    let minimumWeeklyDeposit, maximumWeeklyDeposit: Int
    let documents: Documents
    let state, wrapperDefinitionGlobalID: String
    let lisa: Lisa?
    let interestRate: String?
    let interestRateAmount: Double?
    let logoURL: String?
    let fund: Fund?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case globalID = "GlobalId"
        case name = "Name"
        case categoryType = "CategoryType"
        case type = "Type"
        case friendlyName = "FriendlyName"
        case canWithdraw = "CanWithdraw"
        case productHexCode = "ProductHexCode"
        case annualLimit = "AnnualLimit"
        case depositLimit = "DepositLimit"
        case bonusMultiplier = "BonusMultiplier"
        case minimumWeeklyDeposit = "MinimumWeeklyDeposit"
        case maximumWeeklyDeposit = "MaximumWeeklyDeposit"
        case documents = "Documents"
        case state = "State"
        case wrapperDefinitionGlobalID = "WrapperDefinitionGlobalId"
        case lisa = "Lisa"
        case interestRate = "InterestRate"
        case interestRateAmount = "InterestRateAmount"
        case logoURL = "LogoUrl"
        case fund = "Fund"
    }
}
