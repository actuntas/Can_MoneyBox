//
//  LoginResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation
import Model

public struct LoginResponse: Decodable {
    
    public let user: User
    public let session: Session
    public let actionMessage: ActionMessage
    public let informationMessage: String

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case session = "Session"
        case actionMessage = "ActionMessage"
        case informationMessage = "InformationMessage"
    }
}

