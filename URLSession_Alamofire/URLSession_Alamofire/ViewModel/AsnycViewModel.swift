//
//  AsnycViewModel.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 3/4/24.
//

import Foundation
@MainActor
final class AsyncViewModel: ObservableObject {
    @Published var randomUsers: [RandomUser] = []
    @Published var isLoading = false
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUser() async {
        isLoading = true
        
        let resource = Resource<UserModel>(
            base: "https://randomuser.me/",
            path: "api/",
            params: ["inc": "name,email", "results": "50"],
            header: ["Content-Type": "application/json"])
        
        do {
            let userModel = try await networkService.loadAsync(resource)
            self.randomUsers = userModel.results
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}
