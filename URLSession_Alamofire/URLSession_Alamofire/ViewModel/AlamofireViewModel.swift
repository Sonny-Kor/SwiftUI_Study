//
//  AlamofireViewModel.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/27/24.
//

import Foundation

final class AlamofireViewModel : ObservableObject {
    
    @Published var randomUsers: [RandomUser] = []
    @Published var isLoading = false
    
    let resource = Resource<UserModel>(
        base: "https://randomuser.me/",
        path: "api/",
        params: ["inc": "name,email", "results": "50"],
        header: ["Content-Type": "application/json"])
    
    func getUser() {
        let networkService = NetworkServiceAF()
        
        networkService.load(resource) { result in
            switch result {
            case .success(let user):
                self.randomUsers = user.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
