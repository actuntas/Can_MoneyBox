//
//  AccountsViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol AccountsViewModelOutput: AnyObject {
    func reloadData()
    func displayTitle(title: String)
    func showAlert(title: String, message: String, buttonTitle: String)
}

struct AccountsViewModelDatasource {
    
    var products = [ProductResponse]()
    var name: String
    var securedData: Auth
    var totalValue: Double?
}

final class AccountsViewModel {
    
    let service: NetworkService
    var datasource: AccountsViewModelDatasource
    let keychain = KeychainManager.standard
    var request = AccountsRequest()
    let group = DispatchGroup()
    
    weak var output: AccountsViewModelOutput?
    
    init(service: NetworkService, datasource: AccountsViewModelDatasource) {
        self.service = service
        self.datasource = datasource
    }
    
    func getAccounts() {
        
        self.request.headers.updateValue("Bearer \(datasource.securedData.token)", forKey: "Authorization")
        
        self.service.perform(self.request) { [weak self] result in
            switch result {
            case .success(let accountData):
                print(accountData)
                self?.datasource.totalValue = accountData.totalPlanValue
                self?.datasource.products = accountData.productResponses
                self?.output?.reloadData()
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

extension AccountsViewModel {
    private func refreshTokenAndRetry() {
        print("retry fired")
        group.enter()
        
        getRefreshToken() { _ in
            self.group.leave()
        }
        
        DispatchQueue.global(qos: .default).async {
            self.group.wait()
            self.getAccounts()
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
                    self.keychain.save(self.datasource.securedData, service: KeychainKey.Company, account: self.datasource.securedData.email) //re-cache
                    completion(true)
                case .failure(_):
                    completion(false)
                }
            }
    }
}

extension AccountsViewModel {
    var numberOfRowsInSection: Int {
        datasource.products.count
    }
    
    var titleForHeaderInSection: String {
        return "Total Plan Value: £\(datasource.totalValue ?? 0)"
    }
    
}

extension AccountsViewModel {
    func updateTitle() {
        output?.displayTitle(title: datasource.name)
    }
}

extension AccountsViewModel {
    func removeCache() {
        KeychainManager.standard.delete(service: KeychainKey.Company, account: datasource.securedData.email)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.Name)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.Email)
    }
}



