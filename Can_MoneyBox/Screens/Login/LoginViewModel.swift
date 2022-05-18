//
//  LoginViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol LoginViewModelOutput: AnyObject {
    func handleEmailError(shouldShowError: Bool)
    func handlePasswordError(shouldShowError: Bool)
    func loginCompleted(datasource: LoginViewModelDatasource)
    func showAlert(title: String, message: String, buttonTitle: String)
}

struct LoginViewModelDatasource {
    let name: String?
}

final class LoginViewModel {
    
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    var request = LoginRequest()
    weak var output: LoginViewModelOutput?
    
    func login(email: String, password: String) {
        
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self?.cacheToken(token: token)
                let datasource = LoginViewModelDatasource(name: user.user.firstName)
                self?.output?.loginCompleted(datasource: datasource)
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                }
                
            }
        }
    }
    
    private func cacheToken(token: String) { //extension yaz userdefaultsa
        UserDefaults.standard.set(token, forKey: UserDefaultKeys.Token)
    }
    
}

extension LoginViewModel {
    func validateAndUpdateErrors(text: String?, type: LoginViewModelInput) -> Bool {
        switch type {
        case .email:
            guard let email = text, !email.isEmpty else {
                output?.handleEmailError(shouldShowError: true)
                return false
            }
            let success = email.isEmail
            output?.handleEmailError(shouldShowError: !success)
            return success
            
        case .password:
            guard let password = text, !password.isEmpty else {
                output?.handlePasswordError(shouldShowError: true)
                return false
            }
            let success = password.count > 8
            output?.handlePasswordError(shouldShowError: !success)
            return success
        }
    }
    
}
