//
//  NetworkManager.swift
//  Yummie
//
//  Created by Eslam Ali  on 10/04/2022.
//

import Foundation

class NetworkManager {
    
    static let shared =  NetworkManager()
    
    struct Constants {
        static let baseUrl = "https://yummie.glitch.me"
        
    }
    
    
    /// This function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: the path the the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need to pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route, method: Method,  parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.path
        guard let url = URL(string: urlString) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    
}
