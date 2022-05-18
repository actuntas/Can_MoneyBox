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

// MARK: - Account
struct Account: Codable {
    let type, name, deepLinkIdentifier: String
    let wrapper: Wrapper
    let milestone: Milestone
    let hasCollections: Bool

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case name = "Name"
        case deepLinkIdentifier = "DeepLinkIdentifier"
        case wrapper = "Wrapper"
        case milestone = "Milestone"
        case hasCollections = "HasCollections"
    }
}

// MARK: - Milestone
struct Milestone: Codable {
    let initialStage, endStage: String
    let endStageID: Int

    enum CodingKeys: String, CodingKey {
        case initialStage = "InitialStage"
        case endStage = "EndStage"
        case endStageID = "EndStageId"
    }
}

// MARK: - Wrapper
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

// MARK: - Returns
struct Returns: Codable {
    let simple, lifetime, annualised: Double

    enum CodingKeys: String, CodingKey {
        case simple = "Simple"
        case lifetime = "Lifetime"
        case annualised = "Annualised"
    }
}

// MARK: - ProductResponse
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

// MARK: - AssetBox
struct AssetBox: Codable {
    let title: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
    }
}

// MARK: - Contributions
struct Contributions: Codable {
    let status: String

    enum CodingKeys: String, CodingKey {
        case status = "Status"
    }
}

// MARK: - InvestorAccount
struct InvestorAccount: Codable {
    let contributionsNet, earningsNet, earningsAsPercentage: Double
    let todaysInterest: Double?

    enum CodingKeys: String, CodingKey {
        case contributionsNet = "ContributionsNet"
        case earningsNet = "EarningsNet"
        case earningsAsPercentage = "EarningsAsPercentage"
        case todaysInterest = "TodaysInterest"
    }
}

// MARK: - MoneyboxCircle
struct MoneyboxCircle: Codable {
    let state: String

    enum CodingKeys: String, CodingKey {
        case state = "State"
    }
}

// MARK: - Personalisation
struct Personalisation: Codable {
    let quickAddDeposit: QuickAddDeposit
    let hideAccounts: HideAccounts

    enum CodingKeys: String, CodingKey {
        case quickAddDeposit = "QuickAddDeposit"
        case hideAccounts = "HideAccounts"
    }
}

// MARK: - HideAccounts
struct HideAccounts: Codable {
    let enabled, isHidden: Bool
    let sequence: Int

    enum CodingKeys: String, CodingKey {
        case enabled = "Enabled"
        case isHidden = "IsHidden"
        case sequence = "Sequence"
    }
}

// MARK: - QuickAddDeposit
struct QuickAddDeposit: Codable {
    let amount: Int

    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
    }
}

// MARK: - Product
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

// MARK: - Documents
struct Documents: Codable {
    let keyFeaturesURL: String

    enum CodingKeys: String, CodingKey {
        case keyFeaturesURL = "KeyFeaturesUrl"
    }
}

// MARK: - Fund
struct Fund: Codable {
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

// MARK: - Lisa 
struct Lisa: Codable {
    let maximumBonus: Int

    enum CodingKeys: String, CodingKey {
        case maximumBonus = "MaximumBonus"
    }
}
