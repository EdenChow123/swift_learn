//
//  Dictionary.swift
//  swift-learn
//
//  Created by Eden on 2026/6/25.
//

import Foundation

class MyDictionary {
    
    
    func baseDictionary() {
        
        var user: [String: Any] = [:]
        user["name"] = "Tom"
        user["age"] = 18
        
        
        let name = user["name"] ?? ""
        let age = user["age"] ?? 0
        
        
        user.removeValue(forKey: "name")
        
        /// 遍历
        for (key, value) in user {
            print(key)
            print(value)
        }
        
        
        
        
        
        
        
        
        let common = [
            "token": "123"
        ]

        let params = [
            "page": "123",
            "size": "123"
        ]
        /// 合并
        var result = common
        result.merge(params) { old, new in
            new
        }
        
        
        ///转数组
        let result2 = user.map {
            "\($0.key):\($0.value)"
        }
        
        
        
        
        
        
        
        /// 过滤
        let scores = [
            "Tom": 90,
            "Jack": 50,
            "Lucy": 100
        ]
        
        let result3 = scores.filter {
            $0.value >= 60
        }
        
        
    }
    
}
