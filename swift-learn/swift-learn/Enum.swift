//
//  Enum.swift
//  swift-learn
//
//  Created by Eden on 2026/6/25.
//

import Foundation
import SwiftUI

/// 使用enum 作为常量容器
enum API {
    static let goodsList = ""
    static let goodsDetail = ""
}


/// 分组管理常量
enum ProjectConfig {
    enum PAPI {
        static let host = "www.baidu.com"
    }
    
    enum PColor {
        static let normalColor = Color.red
    }
    
    enum PFont {
        static let normalFont = 18
    }
}




enum LoadState {
    case idle
    case loading
    case success
    case failed(String)
}

struct NetworkView: View {
    
    @State var networkState: LoadState = .idle
    
    var body: some View {
        
        switch networkState {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .success:
            EmptyView()
        case .failed(let message):
            Text(message)
        }
    }
}


enum NetworkError: Error {
    case timeout
    case noInternet
    case serverError(String)
    case decodeError
}

extension NetworkError {

    var message: String {

        switch self {

        case .timeout:
            return "请求超时"

        case .noInternet:
            return "网络不可用"

        case .serverError(let msg):
            return msg

        case .decodeError:
            return "数据解析失败"
        }
    }
}

struct ProductService {

    func fetchProducts() async throws -> [Product] {

        // 模拟网络延迟
        try await Task.sleep(for: .seconds(1))

        let random = Int.random(in: 1...4)

        switch random {

        case 1:
            throw NetworkError.timeout

        case 2:
            throw NetworkError.noInternet

        case 3:
            throw NetworkError.serverError("服务器维护中")

        default:

            return [
                Product(id: 1, name: "iPhone", price: 6999),
                Product(id: 2, name: "iPad", price: 3999),
                Product(id: 3, name: "MacBook", price: 12999),
                Product(id: 4, name: "AirPods", price: 999)
            ]
        }
    }
}
