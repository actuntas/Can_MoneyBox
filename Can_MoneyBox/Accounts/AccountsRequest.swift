//
//  AccountsRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct AccountsRequest: RequestProtocol {
    
    typealias Response = AccountResponse
    
    var path: String = APIConstants.productsPath
    var httpMethod: RequestMethod = .GET
    var headers: [String : String] = APIConstants.loginHeader
    var httpBody: [String : Any] = [:]
    var bearerToken:String? = UserDefaults.standard.string(forKey: "token")
}
