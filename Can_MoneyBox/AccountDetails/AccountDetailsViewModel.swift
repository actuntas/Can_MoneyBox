//
//  AccountDetailViewModel.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 16.05.2022.
//

import Foundation

final class AccountDetailsViewModel {
    
    let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func incrementAmountByTen(amount: String, productId: String, completion: @escaping(Result<String?, NetworkError>) -> Void) {
        var request = IncrementRequest()
        guard let token = UserDefaults.standard.string(forKey: UserDefaultKeys.Token) else { return }
        request.headers.updateValue("Bearer \(token)", forKey: "Authorization")
        request.httpBody = ["Amount":amount, "InvestorProductId":productId]
        
        service.perform(request) { result in
            switch result {
                
            case .success(let amountData):
                let newAmount = String(amountData.moneybox)
                completion(.success(newAmount))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
