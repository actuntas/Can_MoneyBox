//
//  Auth.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct Auth: Codable {
    
    public var token: String
    public let email: String
    public let password: String
    
    public init(token: String, email: String, password: String) {
        self.token = token
        self.email = email
        self.password = password
    }
    
}
