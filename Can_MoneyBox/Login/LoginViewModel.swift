//
//  LoginViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

final class LoginViewModel {
    
    let service: NetworkService
    var request = LoginRequest()
    //var loginViewModelDatasource = LoginViewModelDatasource() coming next
    init(service: NetworkService) {
        self.service = service
    }
    
    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self.cacheToken(token: token)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    private func cacheToken(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
}
