import Foundation
import Combine

class HomeViewModel: ObservableObject{
    @Published var APIData: [ApiResponse] = []
    let apiManager = APIResponseService()
    
    @Published var Data: [Link] = []
    
    func fetchData() {
        apiManager.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.APIData = data
                    print("OnboardingViewModel:fetchData: Data Fetched - \(data)")
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}
