//
//  Response.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation

struct Response<T: Codable>: Codable {
    let action: String
    let code: Int
    let status: Bool
    var data: T?
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case action, code, status, data, message
    }

    func getData() throws -> T? {
        guard code == 200 else {
            throw APIError(statusCode: code, message: message)
        }
        return data
    }

    func getObject() throws -> T {
        if code != 200 {
            throw APIError(statusCode: code, message: message)
        }
        guard let data = data else {
            throw APIError(statusCode: code, message: "Invalid data")
        }
        return data
    }
}

struct Response1<T: Codable>: Codable {
    let action: String
    let code: Int
    let status: Bool
    var data: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case action, code, status, data, message
    }

    func getData() throws -> String? {
        guard code == 200 else {
            throw APIError(statusCode: code, message: message)
        }
        return data
    }

//    func getObject() throws -> T {
//        if code != 200 {
//            throw APIError(statusCode: code, message: message)
//        }
//        guard let data = data else {
//            throw APIError(statusCode: code, message: "Invalid data")
//        }
//        return data
//    }
}
