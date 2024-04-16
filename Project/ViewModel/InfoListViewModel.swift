//
//  InfoListViewModel.swift
//  Project
//
//  Created by Chetan Choudhary on 16/04/24.
//

import Foundation

let authToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"

class InfoListViewModel: ObservableObject{
    
    @Published var accounts : [InfoViewModel] = []
    
    func getallData(){
        WebService().getData(token: authToken) { result in
            switch result{
            case .success(let infoList):
                print(infoList)
                DispatchQueue.main.async {
                    self.accounts = infoList.map { InfoViewModel(info: $0) } // Mapping ApiResponse to InfoViewModel
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        print("Hello")
        
        for index in accounts.indices {
            print(accounts[index])
        }
    }
}

struct InfoViewModel{
    
    let info : ApiResponse
    
    let id = UUID()
    
    var status: Bool {
        return (info.status != 0)
    }
}
