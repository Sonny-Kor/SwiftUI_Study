//
//  AsyncView.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 3/4/24.
//

import SwiftUI

struct AsyncView: View {
    @StateObject private var viewModel = AsyncViewModel(networkService: NetworkService(configuration: .default))
    
    var body: some View {
        NavigationView {
            List(viewModel.randomUsers) { user in
                VStack(alignment: .leading) {
                    Text(user.name.full)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Random Users")
            .task {
                await viewModel.getUser()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

struct Async_Previews: PreviewProvider {
    static var previews: some View {
        AsyncView()
    }
}
