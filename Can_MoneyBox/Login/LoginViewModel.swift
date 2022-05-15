//
//  LoginViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol LoginViewModelOutput: AnyObject {

    func handleEmailError(_ shouldShowError: Bool)
    func handlePasswordError(_ shouldShowError: Bool)
}

enum LoginViewModelInput {
    case email, password
}

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
    weak var output: LoginViewModelOutput?
    
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

extension LoginViewModel {
    func isValid(text: String?, type: LoginViewModelInput) -> Bool {
        switch type {
        case .email:
            guard let email = text, !email.isEmpty else {
                output?.handleEmailError(true)
                return false
            }
            let success = email.count > 8
            output?.handleEmailError(!success)
            return success
        case .password:
            guard let password = text, !password.isEmpty else {
                output?.handlePasswordError(true)
                return false
            }
            let success = password.count > 8
            output?.handlePasswordError(!success)
            return success
        }
    }
    
//    func checkFields(inputType: LoginViewModelInput, email: String?, password: String?) {
//
//        switch inputType {
//        case .email:
//            if isValid(text: email, type: .email) {
//                output?.handleEmailError(false)
//            } else {
//                output?.handleEmailError(true)
//            }
//        case .password:
//            if isValid(text: password, type: .password) {
//                output?.handlePasswordError(false)
//            } else {
//                output?.handlePasswordError(true)
//            }
//        }
//    }
    
    func checkValidation(email: String?, password: String?) -> Bool {
        return isValid(text: email, type: .email) && isValid(text: password, type: .password)
    }
    
}

