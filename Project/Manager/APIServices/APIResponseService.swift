
import Foundation

class APIResponseService {
    @Published var total_clicks: Int = 123
    func fetchData(completion: @escaping (Result<[ApiResponse], Error>) -> Void) {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 1, userInfo: nil)))
                return
            }

            do {
                let data = try JSONSerialization.jsonObject(with: data, options: [])
                print("JSON Data: \(data)")
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
