//
//  AccountsViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol AccountsViewModelOutput: AnyObject {
   
}

struct AccountsViewModelDatasource {
    let accountData: AccountResponse
}

final class AccountsViewModel {
    
    let service: NetworkService
    let name: String
    
    init(service: NetworkService, name: String) {
        self.service = service
        self.name = name
    }
    
    var request = AccountsRequest()
    weak var output: AccountsViewModelOutput?
    
    func getAccounts() {
        
        service.perform(request) { result in
            switch result {
            case .success(let accountData):
                print(accountData)
                let datasource = AccountsViewModelDatasource(accountData: accountData)
                //mapdatasource
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
