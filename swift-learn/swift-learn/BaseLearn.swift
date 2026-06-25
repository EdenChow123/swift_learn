//
//  BaseLearn.swift
//  swift-learn
//
//  Created by Eden on 2026/6/25.
//

import Foundation
import SwiftUI

/// 字符串，数组，字典
class BaseLearn {
    
    var name: String = ""
    var name2 = ""
    var name3: String?
    
    
    var list: Array<String> = []
    var list2: [String] = []
    
    
    
    var dic: [String : String] = [:]
    var dic2: [String : Any] = [:]
}

/// 静态属性 方法
struct BaseLearn2 {
    
    static let name = "EdenChow"
    static let apiHost = "https:\\www.baidu.com"
    
    static func formatDate(_ price: Double) -> Double {
        return 0.0
    }
}

/// 单例
class UserManager {
    static let shared = UserManager()
    private init() {}
}



