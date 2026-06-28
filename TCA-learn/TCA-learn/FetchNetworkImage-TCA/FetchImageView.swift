//
//  FetchImageView.swift
//  TCA-learn
//
//  Created by Eden on 2026/6/28.
//

import SwiftUI
import ComposableArchitecture

struct FetchImageView: View {
    
    let store: StoreOf<FetchImageFeature>
    
    var body: some View {
        
        VStack {
            
            if store.isLoading {
                ProgressView()
                    .frame(width: 200, height: 200)
            } else if let data = store.imageDate,
                      let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } else {
                Color.gray.opacity(0.2)
                    .frame(width: 200, height: 200)
                    .overlay(Text("暂无图片"))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Button {
                store.send(.loadImageTapped)
            } label: {
                Text("获取图片")
            }

        }
        
    }
}

#Preview {
    FetchImageView(
        store: Store(initialState: FetchImageFeature.State()) {
            FetchImageFeature()
        }
    )
}
