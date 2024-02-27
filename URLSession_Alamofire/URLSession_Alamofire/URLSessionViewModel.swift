//
//  URLSessionViewModel.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/27/24.
//
import Foundation
import Combine

final class URLSessionViewModel: ObservableObject {
    @Published var randomUsers: [RandomUser] = []
    @Published var isLoading = false
    
    private let networkService: NetworkService
    private var subscriptions = Set<AnyCancellable>()
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getUser() {
        isLoading = true
        let resource = Resource<UserModel>(
            base: "https://randomuser.me/",
            path: "api/",
            params: ["inc": "name,email", "results": "50"],
            header: ["Content-Type": "application/json"])
        
        networkService.load(resource)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    print("Error \(error.localizedDescription)") // 에러 처리
                }
            }, receiveValue: { [weak self] userModel in
                self?.randomUsers = userModel.results
            })
            .store(in: &subscriptions)
    }
}
