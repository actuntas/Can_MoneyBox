//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

protocol AccountDetailsViewModelProtocol: AnyObject {
    func displayDatasource(_ amount: String)
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
                        self?.output?.displayDatasource(newAmount)
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
            // self.status = .authorized
            self.incrementAmountByTen(amount: self.amount)
            
        }
        
    }
    
    private func getToken() {
        guard let securedData = keychain.read(service: "moneybox.com", account: datasource.email, type: Auth.self) else { return } // alert
        self.authData = securedData
    }
    
    private func refreshToken() {
        var request = LoginRequest()
        status = .authorizing
        request.httpBody = ["Email":authData.email, "Password":authData.password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self?.cacheToken(token: token)
                
                guard let self = self else { return }
                self.status = .authorized
                DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1) {
                    self.incrementAmountByTen(amount: self.amount)
                }
                
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}

private func cacheToken(token: String) {
    let refreshedData = Auth(token: token, email: authData.email, password: authData.password)
    keychain.save(refreshedData, service: "moneybox", account: refreshedData.email)
    status = .authorized
}

private enum AuthorizationStatus {
    case authorized
    case authorizing
}

}
