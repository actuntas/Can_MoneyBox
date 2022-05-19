//
//  Milestone.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

struct Milestone: Codable {
    let initialStage, endStage: String
    let endStageID: Int
    
    enum CodingKeys: String, CodingKey {
        case initialStage = "InitialStage"
        case endStage = "EndStage"
        case endStageID = "EndStageId"
    }
}
