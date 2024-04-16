//
//  API.swift
//  Project
//
//  Created by Chetan Choudhary on 15/04/24.
//

import Foundation

let apiUrl = "https://api.inopenapp.com/api/v1/dashboardNew"
let authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
var chartValues:[Int] = []
var Status: [String] = [];

func test()  {
    guard let url = URL(string: apiUrl) else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("There was a problem with your fetch operation: \(error.localizedDescription)")
            return
        }

        guard let data = data else {
            print("No data received")
            return
        }

        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let data = json["data"] as? [String: Any],
               let overallUrlChart = data["overall_url_chart"] as? [String: Int]{
                
                chartValues = Array(overallUrlChart.values)
                print("Overall URL chart values: \(data)")
                
            } else {
                print("Failed to retrieve overall_url_chart data")
                return
            }
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
            return
        }
    }
    task.resume()
}


