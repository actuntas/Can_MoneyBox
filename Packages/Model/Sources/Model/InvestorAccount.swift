//
//  InvestorAccount.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct InvestorAccount: Codable {
    let contributionsNet, earningsNet, earningsAsPercentage: Double
    let todaysInterest: Double?
    
    enum CodingKeys: String, CodingKey {
        case contributionsNet = "ContributionsNet"
        case earningsNet = "EarningsNet"
        case earningsAsPercentage = "EarningsAsPercentage"
        case todaysInterest = "TodaysInterest"
    }
}
