//
//  FetchImageFeature.swift
//  TCA-learn
//
//  Created by Eden on 2026/6/28.
//

import Foundation

import ComposableArchitecture

enum ImageError: Equatable {
    case errorMessage(String)
    case unkonwn
    
    var message: String {
        switch self {
        case let .errorMessage(text):
            return text
        default:
            return ""
        }
    }
}


@Reducer
struct FetchImageFeature {
    
    @ObservableState
    struct State: Equatable {
        var imageDate: Data?
        var isLoading: Bool = false
        var errorMsg: String = ""
    }
    
    enum Action: Equatable {
        case loadImageTapped
        case imageSuccessRespone(Data)
        case imageFailedRespone(ImageError)
    }
    
    var body: some Reducer<State, Action> {
        
        
        Reduce { state, action in
            switch action {
            case .loadImageTapped:
                
                state.imageDate = nil
                state.isLoading = true
                state.errorMsg = ""
                return .run { send in
                    let _url = URL(string: "https://picsum.photos/200")
                    do {
                        let (data, _) = try await URLSession.shared.data(from: _url!)
                        await send(.imageSuccessRespone(data))
                    } catch {
                        await send(.imageFailedRespone(ImageError.errorMessage("加载失败")))
                    }
                }
            case let .imageSuccessRespone(data):
                
                state.imageDate = data
                state.isLoading = false
                state.errorMsg = ""
                return .none
                
            case let .imageFailedRespone(msg):
                
                state.imageDate = nil
                state.isLoading = false
                state.errorMsg = msg.message
                return .none
            }
        }
        
        
        
    }
}



//let _url = URL(string: "https://picsum.photos/200")
