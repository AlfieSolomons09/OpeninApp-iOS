//
//  APIResponseService.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation

class APIResponseService{
    func getData() async -> [ApiResponse] {
        let endpoint = Endpoint("" as! EndpointProtocol)
        do{
            let response: Response<[ApiResponse]> = try await NetworkUtility.shared.request(endpoint: endpoint)
            let data = response.data ?? []
            print("***, Api Data : \(data)")
            return data
        } catch (let error) {
            print(error.localizedDescription)
        }
        
        return []
    }
}
