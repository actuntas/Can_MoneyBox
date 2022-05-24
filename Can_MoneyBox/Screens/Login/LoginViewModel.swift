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
    func removeLoading()
}

struct LoginViewModelDatasource {
    let name: String
    let secureData: Auth?
}

final class LoginViewModel {
    
    let service: NetworkService
    weak var output: LoginViewModelOutput?
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func login(email: String, password: String) {
        
        var request = LoginRequest()
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                
                let token = user.session.bearerToken
                self?.cacheAuth(authData: Auth(token: token, email: email, password: password))
                self?.cacheInfo(name: user.user.firstName, email: user.user.email)
                let datasource = LoginViewModelDatasource(name: user.user.firstName, secureData: Auth(token: token, email: email, password: password))
                DispatchQueue.main.async {
                    self?.output?.loginCompleted(datasource: datasource)
                }
                
            case .failure(let error):
                
                DispatchQueue.main.async {
                    self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                    self?.output?.removeLoading()
                }
                
            }
        }
    }
    
}

extension LoginViewModel {
    private func cacheAuth(authData: Auth) {
        KeychainManager.standard.save(authData, service: "moneybox.com", account: authData.email)
    }
}

extension LoginViewModel {
    func validateAndUpdateErrors(text: String?, type: LoginViewModelInputTypes) -> Bool {
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

extension LoginViewModel {
    func cacheInfo(name: String, email: String) {
        UserDefaults.standard.set(name, forKey: UserDefaultsKeys.Name)
        UserDefaults.standard.set(email, forKey: UserDefaultsKeys.Email)
    }
}

