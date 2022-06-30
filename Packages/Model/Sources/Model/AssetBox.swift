//
//  AssetBox.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 19.05.2022.
//

import Foundation

public struct AssetBox: Codable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
    }
}
