//
//  LoginViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

struct LoginViewModelDatasource {
    let name: String
    let user: User
}

final class LoginViewModel {
    
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    var request = LoginRequest()
    
    func login(email: String, password: String, completion: @escaping (LoginViewModelDatasource?, Error?) -> Void) {
        
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self?.cacheToken(token: token)
                let datasource = LoginViewModelDatasource(name: user.user.firstName, user: user.user) // will eleminate unnecessary information soon
                completion(datasource, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    private func cacheToken(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
}

