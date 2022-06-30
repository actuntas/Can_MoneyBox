//
//  IncrementRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation
import Network

public struct IncrementRequest: RequestProtocol {
    public init(path: String = APIConstants.addAmountPath, httpMethod: RequestMethod = .POST, headers: [String : String] = APIConstants.loginHeader, httpBody: [String : Any] = [:]) {
        self.path = path
        self.httpMethod = httpMethod
        self.headers = headers
        self.httpBody = httpBody
    }
    
    
    public typealias Response = IncrementResponse
    
    public var path: String = APIConstants.addAmountPath
    public var httpMethod: RequestMethod = .POST
    public var headers: [String : String] = APIConstants.loginHeader
    public var httpBody: [String : Any] = [:]
}
