//
//  IncrementRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

struct IncrementRequest: RequestProtocol {
    
    typealias Response = IncrementResponse
    
    var path: String = APIConstants.addAmountPath
    var httpMethod: RequestMethod = .POST
    var headers: [String : String] = APIConstants.loginHeader
    var httpBody: [String : Any] = [:]
}
