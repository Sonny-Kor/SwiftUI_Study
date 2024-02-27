//
//  URLSessionView.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/27/24.
//

import SwiftUI

struct URLSessionView: View {
    @StateObject private var viewModel = URLSessionViewModel(networkService: NetworkService(configuration: .default))
    
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
            .onAppear {
                viewModel.getUser()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

struct URLSessionView_Previews: PreviewProvider {
    static var previews: some View {
        URLSessionView()
    }
}
