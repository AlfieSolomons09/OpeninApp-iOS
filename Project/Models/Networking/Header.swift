//
//  Header.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation

struct Headers {
    var headers: [String: String] = [
        "content-type": "application/json"
    ]
    
    init(token: String? = nil) {

        if(token == nil) {
//            headers["Authorization"] = UserDefaultsCodable<UserAuthData>.init(key: "UserAuth").getObject()?.data?.token!
        }
        else if let token = token{
            headers["Authorization"] = "Bearer \(token)"
        }
    }
    
    mutating func addHeader(key: String, value: String) {
        headers[key] = value
    }
    
    mutating func setBearerToken(token: String) {
        addHeader(key: "Authorization", value: "Bearer \(token)")
    }
}
