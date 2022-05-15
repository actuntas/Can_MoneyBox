//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

final class AccountDetailViewModel {
    
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func incrementAmountByTen(amount: String, productId: String, completion: @escaping(Result<IncrementResponse, NetworkError>) -> Void) {
        var request = IncrementRequest()
        guard let token = UserDefaults.standard.string(forKey: "token") else { return }
        request.headers.updateValue("Bearer \(token)", forKey: "Authorization")
        request.httpBody = ["Amount":amount, "InvestorProductId":productId]
        
        service.perform(request) { result in
            switch result {
                
            case .success(let newAmount):
                print(newAmount)
                //send to vc and update
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
}
