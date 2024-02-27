//
//  ListView.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/26/24.
//

import SwiftUI

struct ListView: View {
    
    var prdData : RandomUser
    
    var body: some View {
        HStack{
            Image(systemName: "waveform.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
                .padding()
                .background()
                
            VStack(alignment: .leading){
                Text("\(prdData.name.title). \(prdData.name.first) \(prdData.name.last)")
                Text("\(prdData.email)")
                
            }
        }
    }
}

#Preview {
    ListView(prdData: RandomUser.getDummy())
}
