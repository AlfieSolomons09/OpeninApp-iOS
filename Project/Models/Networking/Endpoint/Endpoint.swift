//
//  Endpoint.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation

struct Endpoint {
    static let baseURL = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let endpoint: EndpointProtocol
    
    init(_ endpoint: EndpointProtocol) {
        self.endpoint = endpoint
    }
    
    var method: HTTPMethod_Enum{
        return endpoint.method
    }
    
    func url() throws -> URL{
        guard let baseURL = URL(string: Endpoint.baseURL) else {
            throw APIError(statusCode: -1, message: "Invalid URL: \(Endpoint.baseURL)")
        }
        let finalURL = baseURL.appendingPathComponent(endpoint.path)
        
        return finalURL
    }
    
}
