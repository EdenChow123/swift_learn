//
//  CounterFeature.swift
//  TCA-learn
//
//  Created by Eden on 2026/6/28.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {
    // ✅ State：必须放在 Reducer 内部，且用 @ObservableState
    @ObservableState
    struct State: Equatable {
        var count = 0
    }

    // ✅ Action：也必须放在 Reducer 内部
    enum Action: Equatable {
        case increment
        case decrement
    }

    // ✅ body：唯一 reducer 入口
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .increment:
                state.count += 1
                return .none

            case .decrement:
                state.count -= 1
                return .none
            }
        }
    }
}
