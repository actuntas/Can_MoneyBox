//
//  User.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct User: Codable {
    public let userID: String
    public let hasVerifiedEmail, isPinSet: Bool
    public let amlStatus: String
    public let amlAttempts: Int
    public let roundUpMode, jisaRoundUpMode, investorProduct, registrationStatus: String
    public let jisaRegistrationStatus, directDebitMandateStatus, dateCreated, animal: String
    public let referralCode, intercomHmac, intercomHmaciOS, intercomHmacAndroid: String
    public let hasCompletedTutorial: Bool
    public let lastPayment, previousMoneyboxAmount: Int
    public let moneyboxRegistrationStatus, email, firstName, lastName: String
    public let mobileNumber: String
    public let roundUpWholePounds, doubleRoundUPS: Bool
    public let moneyboxAmount, investmentTotal: Int
    public let canReinstateMandate, directDebitHasBeenSubmitted, monthlyBoostEnabled: Bool
    public let monthlyBoostAmount, monthlyBoostDay: Int
    public let restrictedDevice, emailTwoFactorEnabled: Bool
    public let cohort: Int
    
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
