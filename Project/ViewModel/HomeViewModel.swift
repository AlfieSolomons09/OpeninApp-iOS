//
//  HomeViewModel.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    static let shared = HomeViewModel()
    @Published var apiResposeData: [ApiResponse] = []
    @Published var isLoading: Bool = false
    
    private let apiNetworkService = APIResponseService()
    
    init(){
        Task{
            await fetch()
        }
    }
    
    func fetch() async {
        await MainActor.run {
            isLoading = true
        }
        
        
        async let apiResponseAsync = apiNetworkService.getData()
        
        let (data) = await (apiResponseAsync)
        await MainActor.run(body: {
            apiResposeData = data
            isLoading = false
        })
    }
}
