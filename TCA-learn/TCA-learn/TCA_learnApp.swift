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
//            builtCounterView()
            builtFetchImageView()
        }
    }
    
    
    
    
    
    
    
    func builtCounterView() -> some View  {
        CounterView(
            store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
            }
        )
    }
    
    func builtFetchImageView() -> some View  {
        FetchImageView(
            store: Store(initialState: FetchImageFeature.State()) {
                FetchImageFeature()
            }
        )
    }
    
}
