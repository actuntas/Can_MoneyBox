//
//  AccountsViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol AccountsViewModelOutput: AnyObject {
    func reloadData()
}

struct AccountsViewModelDatasource {
    var products = [ProductResponse]()
}

final class AccountsViewModel {
    
    let service: NetworkService
    let name: String
    var datasource = AccountsViewModelDatasource()
    weak var output: AccountsViewModelOutput?
    
    init(service: NetworkService, name: String) {
        self.service = service
        self.name = name
    }
    
    
    
    func getAccounts() {
        var request = AccountsRequest()
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        request.headers.updateValue("Bearer \(token)", forKey: "Authorization")
        
        service.perform(request) { [weak self] result in
            switch result {
            case .success(let accountData):
                print(accountData)
                self?.datasource.products = accountData.productResponses
                self?.output?.reloadData()
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}


