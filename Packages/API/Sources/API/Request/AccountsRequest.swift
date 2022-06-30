//
//  AccountsRequest.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation
import Network

public struct AccountsRequest: RequestProtocol {
    public init(path: String = APIConstants.productsPath, httpMethod: RequestMethod = .GET, headers: [String : String] = APIConstants.loginHeader, httpBody: [String : Any] = [:]) {
        self.path = path
        self.httpMethod = httpMethod
        self.headers = headers
        self.httpBody = httpBody
    }
    
    public typealias Response = AccountResponse
    
    public var path: String = APIConstants.productsPath
    public var httpMethod: RequestMethod = .GET
    public var headers: [String : String] = APIConstants.loginHeader
    public var httpBody: [String : Any] = [:]
}
