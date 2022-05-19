//
//  AccountsViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol AccountsViewModelOutput: AnyObject {
    func reloadData()
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
    weak var output: AccountsViewModelOutput?
    
    init(service: NetworkService, datasource: AccountsViewModelDatasource) {
        self.service = service
        self.datasource = datasource
    }
    
    var request = AccountsRequest()
    
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
                DispatchQueue.main.async {
                    self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
                }
                
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
    func removeInfo() {
        KeychainManager.standard.delete(service: KeychainKey.Company, account: datasource.securedData.email)
    }
    
}



