//
//  RequestProtocol.swift
//  Can_MoneyBox
//
//  Created by CAN TUNTAS on 15.05.2022.
//

import Foundation

protocol RequestProtocol {
    
    associatedtype Response
    var path: String { set get }
    var httpMethod: RequestMethod { set get }
    var headers: Dictionary<String,String> { set get }
    var httpBody: [String:Any] { set get } 
    var bearerToken:String? { set get }
    func decode(_ data: Data) throws -> Response
}

extension RequestProtocol {
    
    var baseURL: String {
        APIConstants.host
    }
    
    var path:String? {
        APIConstants.loginPath
    }
    
    var headers: [String : String] {
        APIConstants.loginHeader
    }
    
    var bearerToken:String? {
        nil
    }
    
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        components.path = path
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        if bearerToken != nil {
            urlRequest.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if !httpBody.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: httpBody)
        }
        
        return urlRequest
    }
    
}

extension RequestProtocol where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}


