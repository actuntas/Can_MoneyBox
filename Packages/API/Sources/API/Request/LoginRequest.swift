//
//  LoginRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation
import Network
import Model

public struct LoginRequest: RequestProtocol {
    public init(path: String = APIConstants.loginPath, httpMethod: RequestMethod = .POST, headers: [String : String] = APIConstants.loginHeader, httpBody: [String : Any] = [:]) {
        self.path = path
        self.httpMethod = httpMethod
        self.headers = headers
        self.httpBody = httpBody
    }
    
    public typealias Response = LoginResponse
    public var path: String = APIConstants.loginPath
    public var httpMethod: RequestMethod = .POST
    public var headers: [String : String] = APIConstants.loginHeader
    public var httpBody: [String : Any] = [:]
}
