//
//  Product.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Product: Codable {
    public let id: Int
    public let globalID, name, categoryType, type: String
    public let friendlyName: String
    public let canWithdraw: Bool
    public let productHexCode: String?
    public let annualLimit, depositLimit: Int
    public let bonusMultiplier: Double
    public let minimumWeeklyDeposit, maximumWeeklyDeposit: Int
    public let documents: Documents
    public let state, wrapperDefinitionGlobalID: String
    public let lisa: Lisa?
    public let interestRate: String?
    public let interestRateAmount: Double?
    public let logoURL: String?
    public let fund: Fund?
    
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
