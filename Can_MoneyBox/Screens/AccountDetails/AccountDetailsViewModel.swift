//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

protocol AccountDetailsViewModelProtocol: AnyObject {
    func updateValue(_ amount: String)
    func showAlert(title: String, message: String, buttonTitle: String)
}

struct AccountDetailsViewModelDatasource {
    let product: ProductResponse
    let email: String
}

final class AccountDetailsViewModel {
    
    private let service: NetworkService
    private var status: AuthorizationStatus = .authorized
    private let keychain = KeychainManager.standard
    
    var amount: String!
    var datasource: AccountDetailsViewModelDatasource
    var authData: Auth!
    
    init(service: NetworkService, product: ProductResponse, email: String) {
        self.service = service
        self.datasource = AccountDetailsViewModelDatasource(product: product, email: email)
    }
    
    weak var output: AccountDetailsViewModelProtocol?
    
    func incrementAmountByTen(amount: String) {
        self.amount = amount
        
        switch status {
            
        case .authorized:
            
            getToken()
            
            var request = IncrementRequest()
            request.headers.updateValue("Bearer \(authData.token)", forKey: "Authorization")
            request.httpBody = ["Amount":amount, "InvestorProductId":datasource.product.id]
            
            service.perform(request) { [weak self] result in
                switch result {
                    
                case .success(let amountData):
                    let newAmount = String(amountData.moneybox)
                    DispatchQueue.main.async {
                        self?.output?.updateValue(newAmount)
                    }
                    
                case .failure(let error):
                    if error == .invalidCredentials {
                        guard let email = self?.authData.email,
                              let password = self?.authData.password else {
                            DispatchQueue.main.async {
                                self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                            }
                            return
                        }
                        self?.refreshToken(email: email, password: password)
                    } else {
                        DispatchQueue.main.async {
                            self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                        }
                        
                    }
                }
            }
            
        case .authorizing:
            self.status = .authorized
            self.incrementAmountByTen(amount: self.amount)
            
        }
        
    }
    
    private func getToken() {
        guard let securedData = keychain.read(service: "moneybox.com", account: datasource.email, type: Auth.self) else { return } // alert
        self.authData = securedData
    }
    
    private func refreshToken(email: String, password: String) {
        var request = LoginRequest()
        status = .authorizing
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self?.cacheToken(token: token, email: email, password: password)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    guard let self = self else { return }
                    self.status = .authorized
                    self.incrementAmountByTen(amount: self.amount)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func cacheToken(token: String, email: String, password: String) {
        let refreshedData = Auth(token: token, email: email, password: password)
        keychain.save(refreshedData, service: "moneybox", account: email)
    }
    
    private enum AuthorizationStatus {
        case authorized
        case authorizing
    }
    
}
