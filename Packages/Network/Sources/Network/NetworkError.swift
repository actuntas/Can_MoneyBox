//
//  NetworkError.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

public enum NetworkError: String, Error {
    case invalidRequest = "Invalid request"
    case invalidURL = "Invalid url"
    case invalidData = "Invalid data"
    case invalidResponse = "Invalid response"
    case invalidCredentials = "Invalid credentials"
}
