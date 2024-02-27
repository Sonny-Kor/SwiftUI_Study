//
//  ContentView.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/26/24.
//

import SwiftUI

struct FirestView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "waveform.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                    .padding()
                HStack(spacing: 20){
                    NavigationLink {
                        URLSessionView()
                    } label: {
                        Text("URLSession")
                            .font(.system(size: 20, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .frame(width: 120)
                    .padding(EdgeInsets(top: 20, leading: 13, bottom: 20, trailing: 13))
                    .background(.blue)
                    .cornerRadius(40)
                    NavigationLink {
                        AlamofireView()
                    } label: {
                        Text("Alamofire")
                            .font(.system(size: 20, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .frame(width: 120)
                    .padding(EdgeInsets(top: 20, leading: 13, bottom: 20, trailing: 13))
                    .background(.blue)
                    .cornerRadius(40)
                }
                
            }
            
        }
        .padding()
        .navigationTitle("Compare Request")
    }
}


#Preview {
    FirestView()
}
