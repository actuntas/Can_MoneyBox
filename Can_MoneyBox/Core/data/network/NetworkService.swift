//
//  NetworkService.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol NetworkService {
    
    func perform<Request: RequestProtocol>(_ request: Request, completion: @escaping (Result<Request.Response, NetworkError>) -> Void)
}

class DefaultNetworkService: NetworkService {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    private var tokenExpirationDate: Date? {
        UserDefaults.standard.object(forKey: UserDefaultKeys.TokenExpireDate) as? Date
    }
    
    private var shouldRefreshToken: Bool {
        guard let expireDate = tokenExpirationDate else { return false }
        let currentDate = Date()
        let oneMinute: TimeInterval = 60
        return currentDate.addingTimeInterval(oneMinute) >= expireDate
    }

    func perform<Request:RequestProtocol>(_ request: Request, completion: @escaping (Result<Request.Response, NetworkError>) -> Void) {
        
        if shouldRefreshToken {
            //refresh somehow
        }
        
        guard let urlRequest = try? request.createURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                return completion(.failure(.invalidRequest))
            }
            
            guard let responseCode = (response as? HTTPURLResponse)?.statusCode, responseCode != 401 else {
                print("token expired --------------")
                return completion(.failure(.invalidCredentials))
            }
            
            guard responseCode != 403 else {
                return completion(.failure(.invalidRequest))
            }
            
            guard 200..<300 ~= responseCode else {
                return completion(.failure(.invalidResponse))
            }
            print("\(responseCode) ----------------")
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                print(String(data: data, encoding: .utf8)!)
                try completion(.success(request.decode(data)))
            } catch {
                print(error)
                completion(.failure(.invalidData))
            }
            
        }.resume()
    }
    
    
}
