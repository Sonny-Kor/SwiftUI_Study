//
//  TCA_SampleApp.swift
//  TCA_Sample
//
//  Created by 승재 on 2/28/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_SampleApp: App {
    
    static let store = Store(initialState: CounterFeature.State()) {
      CounterFeature()
        ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCA_SampleApp.store)

        }
    }
}
