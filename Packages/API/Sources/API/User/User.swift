//
//  File.swift
//  
//
//  Created by CAN TUNTAS on 30.06.2022.
//

import Foundation
import Network

public final class UserAPI {
    let service: NetworkService = DefaultNetworkService()
    public static let shared = UserAPI()
    
    public func login(email: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        var request = LoginRequest()
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        service.perform(request) { result in
            completion(result)
        }
    }
}
