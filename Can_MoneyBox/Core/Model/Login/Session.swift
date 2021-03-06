//
//  Session.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Session: Codable {
    let bearerToken, externalSessionID, sessionExternalID: String
    let expiryInSeconds: Int
    
    enum CodingKeys: String, CodingKey {
        case bearerToken = "BearerToken"
        case externalSessionID = "ExternalSessionId"
        case sessionExternalID = "SessionExternalId"
        case expiryInSeconds = "ExpiryInSeconds"
    }
}
