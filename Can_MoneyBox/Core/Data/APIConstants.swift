//
//  APIConstants.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

enum APIConstants {
    static let host = "api-test02.moneyboxapp.com"
    static let loginPath = "/users/login"
    static let productsPath = "/investorproducts"
    static let addAmountPath = "/oneoffpayments"
    static let loginHeader = ["AppId":"8cb2237d0679ca88db6464", "Content-Type":"application/json", "appVersion":"8.10.0", "apiVersion":"3.0.0"]
}
