//
//  LoginRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct LoginRequest: RequestProtocol {
    
    typealias Response = LoginResponse
    
    var path: String = APIConstants.loginPath
    var httpMethod: RequestMethod = .POST
    var headers: [String : String] = APIConstants.loginHeader
    var httpBody: [String : Any] = [:]
    var bearerToken:String? = nil
}
