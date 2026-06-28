//
//  CounterView.swift
//  TCA-learn
//
//  Created by Eden on 2026/6/28.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>

    var body: some View {
        HStack(spacing: 20) {
            Button {
                store.send(.decrement)
            } label: {
                Image(systemName: "minus")
            }

            Text("\(store.count)")
                .font(.title)

            Button {
                store.send(.increment)
            } label: {
                Image(systemName: "plus")
            }
        }
        .buttonStyle(.bordered)
        .padding()
    }
}

#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}
