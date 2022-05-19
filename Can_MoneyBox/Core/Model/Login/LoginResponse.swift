//
//  LoginResponse.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct LoginResponse: Decodable {
    
    let user: User
    let session: Session
    let actionMessage: ActionMessage
    let informationMessage: String

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case session = "Session"
        case actionMessage = "ActionMessage"
        case informationMessage = "InformationMessage"
    }
}

