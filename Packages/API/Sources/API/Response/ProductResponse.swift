//
//  ProductResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation
import Model

public struct ProductResponse: Codable {
    public let id: Int
    public let assetBoxGlobalID: String
    public let planValue: Double
    public let totalCollection, fixedAllocationsTotal, moneybox, subscriptionAmount: Int
    public let totalFees: Double
    public let isSelected, isFavourite: Bool
    public let collectionDayMessage, wrapperID: String
    public let isCashBox: Bool
    public let pendingInstantBankTransferAmount: Int
    public let assetBox: AssetBox
    public let product: Product
    public let investorAccount: InvestorAccount
    public let personalisation: Personalisation
    public let contributions: Contributions
    public let moneyboxCircle: MoneyboxCircle
    public let isSwitchVisible: Bool
    public let state, dateCreated: String
    
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
