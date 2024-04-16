//
//  API.swift
//  Project
//
//  Created by Chetan Choudhary on 15/04/24.
//

import Foundation

class HourlyNetworkService{
    func getHourlyRooms() async -> [GetHourlyData] {
        let endpoint = Endpoint(HourlyEndpoint.getHourlyAvailableRooms)
        do{
            let response: Response<[GetHourlyData]> = try await NetworkUtility.shared.request(endpoint: endpoint)
            let data = response.data ?? []
            print("***, All Hourly response fetched : \(data)")
            return data
        } catch (let error) {
            print(error.localizedDescription)
        }
        
        return []
    }
}



