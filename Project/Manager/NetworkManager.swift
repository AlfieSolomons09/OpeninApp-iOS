import Foundation

class NetworkManager: ObservableObject {
    @Published var totalClicks: Int = 123
    @Published var topLocation: String = "Ahamedabad"
    @Published var topSource: String = "Instagram"
    @Published var recentLinks: [[String: Any]] = []
    @Published var topLinks: [[String: Any]] = []
    @Published var chartData: [String: Any] = [:]
    private let urlString = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let authToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    func fetchDashboardData() {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue(authToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error making network request: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    
//                    print("jsonObjec: \(jsonObject)")
                    let dataObject = jsonObject["data"] as? [String: Any]
                    print("dataObject: \(dataObject)")
                    let recentLink = dataObject?["recent_links"] as? [[String: Any]]
                    self.recentLinks = recentLink ?? []
                    
                    let topLink = dataObject?["top_links"] as? [[String: Any]]
                    self.topLinks = topLink ?? []
                    
                    let chartData = dataObject?["overall_url_chart"] as? [String: Any]
                    self.chartData = chartData ?? [:]
                    
                    print("chartData: \(chartData)")
                    
                    if let totalClicks = jsonObject["total_clicks"] as? Int, 
                        let topLocation = jsonObject["top_location"] as? String,
                        let topSource = jsonObject["top_source"] as? String {
                        DispatchQueue.main.async {
                            self.totalClicks = totalClicks
                            self.topLocation = topLocation
                            self.topSource = topSource
                        }
                    } else {
                        print("Data not found")
                    }
                } else {
                    print("Error: JSON is not a dictionary")
                }
            } catch {
                print("Error decoding JSON: \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON STRING: \(jsonString)")
                }
            }
        }.resume()
    }
}
