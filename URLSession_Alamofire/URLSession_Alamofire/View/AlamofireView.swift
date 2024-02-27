//
//  AlamofireView.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/27/24.
//

import SwiftUI

struct AlamofireView: View {
    @StateObject private var viewModel = AlamofireViewModel()
    
    var body: some View {
        
        List(viewModel.randomUsers) { user in
            VStack(alignment: .leading) {
                Text(user.name.full)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
            }
        }
        .navigationTitle("Random Users")
        .navigationBarTitleDisplayMode(.large)
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

#Preview {
    AlamofireView()
}
