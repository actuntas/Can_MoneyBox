//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

protocol AccountDetailsViewModelProtocol: AnyObject {
    func updateAmount(_ amount: String)
    func displayDatasource(datasource: AccountDetailsViewModelDatasource)
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
    
    var request = IncrementRequest()
    weak var output: AccountDetailsViewModelProtocol?
    
    func incrementAmountByTen(amount: String) {
        self.amount = amount
        
        switch status {
            
        case .authorized:
            
            getToken()
            
            request.headers.updateValue("Bearer \(authData.token)", forKey: "Authorization")
            request.httpBody = ["Amount":amount, "InvestorProductId":datasource.product.id]
            
            service.perform(request) { [weak self] result in
                switch result {
                    
                case .success(let amountData):
                    let newAmount = String(amountData.moneybox)
                    DispatchQueue.main.async {
                        self?.output?.updateAmount(newAmount)
                    }
                    
                case .failure(let error):
                    if error == .invalidCredentials {
                   
                        self?.refreshToken()
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
    
    private func refreshToken() {
        var loginRequest = LoginRequest()
        status = .authorizing
        loginRequest.httpBody = ["Email":authData.email, "Password":authData.password, "Idfa":"idfa"]
        
        service.perform(loginRequest) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                
                
                
                //self.status = .authorized sil
                DispatchQueue.global(qos: .userInitiated).sync {
                    self.cacheToken(token: token)
                    self.incrementAmountByTen(amount: self.amount)
                }
                
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
   

private func cacheToken(token: String) {
    self.authData = Auth(token: token, email: authData.email, password: authData.password)
    keychain.save(authData, service: "moneybox", account: authData.email)
    status = .authorized
}
    


private enum AuthorizationStatus {
    case authorized
    case authorizing
}

}

extension AccountDetailsViewModel {
    func sendDatasource() {
        output?.displayDatasource(datasource: datasource)
    }
}
