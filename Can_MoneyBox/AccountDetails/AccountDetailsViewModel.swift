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
}

final class AccountDetailsViewModel {
    
    private let service: NetworkService
    private var status: AuthorizationStatus = .authorized
    
    var amount: String!
    var datasource: AccountDetailsViewModelDatasource
    
    init(service: NetworkService, product: ProductResponse) {
        self.service = service
        self.datasource = AccountDetailsViewModelDatasource(product: product)
    }
    
    weak var output: AccountDetailsViewModelProtocol?
    
    func incrementAmountByTen(amount: String) {
        self.amount = amount
        switch status {
            
        case .authorized:
            var request = IncrementRequest()
            guard let token = UserDefaults.standard.string(forKey: UserDefaultKeys.Token) else { return }
            request.headers.updateValue("Bearer \(token)", forKey: "Authorization")
            request.httpBody = ["Amount":amount, "InvestorProductId":self.productId]
            
            service.perform(request) { [weak self] result in
                switch result {
                    
                case .success(let amountData):
                    let newAmount = String(amountData.moneybox)
                    DispatchQueue.main.async {
                        self?.output?.updateValue(newAmount)
                    }
                    
                case .failure(let error):
                    if error == .invalidCredentials {
                        self?.refreshToken(email: "test+ios@moneyboxapp.com", password: "P455word12")
                    } else {
                        //self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                    }
                }
            }
            
        case .authorizing:
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                guard let self = self else { return }
                self.status = .authorized
                self.incrementAmountByTen(amount: self.amount)
            }
        }
        
        
    }
    
    private func refreshToken(email: String, password: String) {
        var request = LoginRequest()
        status = .authorizing
        request.httpBody = ["Email":email, "Password":password, "Idfa":"idfa"]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let user):
                let token = user.session.bearerToken
                self?.cacheToken(token: token)
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
    
    private func cacheToken(token: String) {
        UserDefaults.standard.set(token, forKey: UserDefaultKeys.Token)
    }
    
    private enum AuthorizationStatus {
        case authorized
        case authorizing
    }
    
}

extension AccountDetailsViewModel {
    var productId: String {
        String(datasource.product.product.id)
    }
}
