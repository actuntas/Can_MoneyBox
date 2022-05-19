//
//  ProductResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct ProductResponse: Codable {
    let id: Int
    let assetBoxGlobalID: String
    let planValue: Double
    let totalCollection, fixedAllocationsTotal, moneybox, subscriptionAmount: Int
    let totalFees: Double
    let isSelected, isFavourite: Bool
    let collectionDayMessage, wrapperID: String
    let isCashBox: Bool
    let pendingInstantBankTransferAmount: Int
    let assetBox: AssetBox
    let product: Product
    let investorAccount: InvestorAccount
    let personalisation: Personalisation
    let contributions: Contributions
    let moneyboxCircle: MoneyboxCircle
    let isSwitchVisible: Bool
    let state, dateCreated: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case assetBoxGlobalID = "AssetBoxGlobalId"
        case planValue = "PlanValue"
        case totalCollection = "TotalCollection"
        case fixedAllocationsTotal = "FixedAllocationsTotal"
        case moneybox = "Moneybox"
        case subscriptionAmount = "SubscriptionAmount"
        case totalFees = "TotalFees"
        case isSelected = "IsSelected"
        case isFavourite = "IsFavourite"
        case collectionDayMessage = "CollectionDayMessage"
        case wrapperID = "WrapperId"
        case isCashBox = "IsCashBox"
        case pendingInstantBankTransferAmount = "PendingInstantBankTransferAmount"
        case assetBox = "AssetBox"
        case product = "Product"
        case investorAccount = "InvestorAccount"
        case personalisation = "Personalisation"
        case contributions = "Contributions"
        case moneyboxCircle = "MoneyboxCircle"
        case isSwitchVisible = "IsSwitchVisible"
        case state = "State"
        case dateCreated = "DateCreated"
    }
}
