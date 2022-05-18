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
    var name: String?
}

final class AccountsViewModel {
    
    let service: NetworkService
    var datasource = AccountsViewModelDatasource()
    weak var output: AccountsViewModelOutput?
    
    init(service: NetworkService, datasource: AccountsViewModelDatasource) {
        self.service = service
        self.datasource = datasource
    }
    
    var request = AccountsRequest()
    
    func getAccounts() {
        
        guard let token = UserDefaults.standard.string(forKey: UserDefaultKeys.Token) else { return }
        request.headers.updateValue("Bearer \(token)", forKey: "Authorization")
        
        service.perform(request) { [weak self] result in
            switch result {
            case .success(let accountData):
                print(accountData)
                self?.datasource.products = accountData.productResponses
                self?.output?.reloadData()
            case .failure(let error):
                self?.output?.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
            }
        }
    }
}

extension AccountsViewModel {
    var numberOfRowsInSection: Int {
        datasource.products.count
    }
    
    var titleForHeaderInSection: String {
        "Welcome, \(String(describing: datasource.name))"
    }
    
}


