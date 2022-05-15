//
//  LoginResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct LoginResponse: Decodable {
    
    let user: User
    let session: Session
    let actionMessage: ActionMessage
    let informationMessage: String

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case session = "Session"
        case actionMessage = "ActionMessage"
        case informationMessage = "InformationMessage"
    }
}

// MARK: - ActionMessage
struct ActionMessage: Codable {
    let type, message: String
    let actions: [Action]

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case message = "Message"
        case actions = "Actions"
    }
}

// MARK: - Action
struct Action: Codable {
    let label: String
    let amount: Int
    let type, animation: String

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case amount = "Amount"
        case type = "Type"
        case animation = "Animation"
    }
}

// MARK: - Session
struct Session: Codable {
    let bearerToken, externalSessionID, sessionExternalID: String
    let expiryInSeconds: Int

    enum CodingKeys: String, CodingKey {
        case bearerToken = "BearerToken"
        case externalSessionID = "ExternalSessionId"
        case sessionExternalID = "SessionExternalId"
        case expiryInSeconds = "ExpiryInSeconds"
    }
}

// MARK: - User
struct User: Codable {
    let userID: String
    let hasVerifiedEmail, isPinSet: Bool
    let amlStatus: String
    let amlAttempts: Int
    let roundUpMode, jisaRoundUpMode, investorProduct, registrationStatus: String
    let jisaRegistrationStatus, directDebitMandateStatus, dateCreated, animal: String
    let referralCode, intercomHmac, intercomHmaciOS, intercomHmacAndroid: String
    let hasCompletedTutorial: Bool
    let lastPayment, previousMoneyboxAmount: Int
    let moneyboxRegistrationStatus, email, firstName, lastName: String
    let mobileNumber: String
    let roundUpWholePounds, doubleRoundUPS: Bool
    let moneyboxAmount, investmentTotal: Int
    let canReinstateMandate, directDebitHasBeenSubmitted, monthlyBoostEnabled: Bool
    let monthlyBoostAmount, monthlyBoostDay: Int
    let restrictedDevice, emailTwoFactorEnabled: Bool
    let cohort: Int

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case hasVerifiedEmail = "HasVerifiedEmail"
        case isPinSet = "IsPinSet"
        case amlStatus = "AmlStatus"
        case amlAttempts = "AmlAttempts"
        case roundUpMode = "RoundUpMode"
        case jisaRoundUpMode = "JisaRoundUpMode"
        case investorProduct = "InvestorProduct"
        case registrationStatus = "RegistrationStatus"
        case jisaRegistrationStatus = "JisaRegistrationStatus"
        case directDebitMandateStatus = "DirectDebitMandateStatus"
        case dateCreated = "DateCreated"
        case animal = "Animal"
        case referralCode = "ReferralCode"
        case intercomHmac = "IntercomHmac"
        case intercomHmaciOS = "IntercomHmaciOS"
        case intercomHmacAndroid = "IntercomHmacAndroid"
        case hasCompletedTutorial = "HasCompletedTutorial"
        case lastPayment = "LastPayment"
        case previousMoneyboxAmount = "PreviousMoneyboxAmount"
        case moneyboxRegistrationStatus = "MoneyboxRegistrationStatus"
        case email = "Email"
        case firstName = "FirstName"
        case lastName = "LastName"
        case mobileNumber = "MobileNumber"
        case roundUpWholePounds = "RoundUpWholePounds"
        case doubleRoundUPS = "DoubleRoundUps"
        case moneyboxAmount = "MoneyboxAmount"
        case investmentTotal = "InvestmentTotal"
        case canReinstateMandate = "CanReinstateMandate"
        case directDebitHasBeenSubmitted = "DirectDebitHasBeenSubmitted"
        case monthlyBoostEnabled = "MonthlyBoostEnabled"
        case monthlyBoostAmount = "MonthlyBoostAmount"
        case monthlyBoostDay = "MonthlyBoostDay"
        case restrictedDevice = "RestrictedDevice"
        case emailTwoFactorEnabled = "EmailTwoFactorEnabled"
        case cohort = "Cohort"
    }
}
