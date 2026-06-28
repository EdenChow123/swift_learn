//
//  TCA_learnApp.swift
//  TCA-learn
//
//  Created by Eden on 2026/6/28.
//

import SwiftUI
import ComposableArchitecture
@main
struct TCA_learnApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
        }
    }
}
