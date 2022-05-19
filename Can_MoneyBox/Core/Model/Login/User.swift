//
//  User.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

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
