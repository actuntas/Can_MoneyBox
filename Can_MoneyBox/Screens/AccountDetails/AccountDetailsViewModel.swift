//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation
import Network
import Model
import API

protocol AccountDetailsViewModelProtocol: AnyObject {
    func updateAmount(_ amount: String)
    func displayDatasource(datasource: AccountDetailsViewModelDatasource)
    func showAlert(title: String, message: String, buttonTitle: String)
}

struct AccountDetailsViewModelDatasource {
    let product: ProductResponse
    var securedData: Auth
}

final class AccountDetailsViewModel {
    
    private let service: NetworkService
    
    var amount: String!
    var datasource: AccountDetailsViewModelDatasource
    let group = DispatchGroup()
    
    weak var output: AccountDetailsViewModelProtocol?
    
    init(service: NetworkService, product: ProductResponse, authData: Auth) {
        self.service = service
        self.datasource = AccountDetailsViewModelDatasource(product: product, securedData: authData)
    }
    
    func incrementAmountByTen(amount: String) {
        self.amount = amount
        
        var request = IncrementRequest()
        
        request.headers.updateValue("Bearer \(datasource.securedData.token)", forKey: "Authorization")
        request.httpBody = ["Amount":amount, "InvestorProductId":datasource.product.id]
        
        service.perform(request) { [weak self] result in
            switch result {
                
            case .success(let amountData):
                let newAmount = Int(amountData.moneybox)
                DispatchQueue.main.async {
                    self?.output?.updateAmount(String(newAmount))
                    print(newAmount)
                }
                
            case .failure(let error):
                if error == .invalidCredentials {
                    self?.refreshTokenAndRetry()
                } else {
                    DispatchQueue.main.async {
                        self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                    }
                    
                }
            }
        }
        
    }
    
}

extension AccountDetailsViewModel {
    
    private func refreshTokenAndRetry() {
        group.enter()
        
        getRefreshToken() { _ in
            self.group.leave()
        }
        
        DispatchQueue.global(qos: .default).async {
            self.group.wait()
            self.incrementAmountByTen(amount: self.amount)
        }
        
    }
    
    private func getRefreshToken(completion: @escaping (Bool) -> ())  {
        
        var loginRequest = LoginRequest()
        
        loginRequest.httpBody = ["Email":datasource.securedData.email, "Password":datasource.securedData.password, "Idfa":"idfa"]
        
        service.perform(loginRequest) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let newTokenData):
                self.datasource.securedData.token = newTokenData.session.bearerToken
                KeychainManager.standard.save(self.datasource.securedData, service: KeychainKey.Company, account: self.datasource.securedData.email)
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
}

extension AccountDetailsViewModel {
    func getDatasource() {
        output?.displayDatasource(datasource: datasource)
    }
}
