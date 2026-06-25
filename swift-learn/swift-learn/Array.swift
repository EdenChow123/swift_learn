//
//  Array.swift
//  swift-learn
//
//  Created by Eden on 2026/6/25.
//

import Foundation

class EdenArray {
    
    

    var products = [
        Product(id: 1, name: "iPhone", price: 6999),
        Product(id: 2, name: "iPad", price: 3999),
        Product(id: 3, name: "MacBook", price: 12999),
        Product(id: 4, name: "AirPods", price: 999)
    ]
    
    
    
    func arrayFunction() {
        
       let firstProducts = products.first;
       let lastProducts = products.last;
        
        let indexProducts = products[0];
        
        let result1 = products.filter {
            $0.price > 5000
        }
        
        let result2 = products.filter {
            $0.price > 1000 &&
            $0.name.contains("i")
        }
        
        products.remove(at: 0)
        
        products.removeLast()
        
        products.removeFirst()
        
        products.removeAll()
        
        products.removeAll {
            $0.id == 2
        }
        
        if let index = products.firstIndex(where: {
            $0.id == 2
        }) {

            products[index] = Product(
                id: 2,
                name: "iPad Pro",
                price: 5999
            )
        }
        
        products.append(
            Product(
                id: 5,
                name: "Watch",
                price: 2999
            )
        )
        
        products.append(contentsOf: [
            Product(id: 6, name: "TV", price: 5999),
            Product(id: 7, name: "HomePod", price: 1999)
        ])
        
        
        /// 升序
        let sorted = products.sorted {
            $0.price < $1.price
        }
        
        /// 降序
        let sorted2 = products.sorted {
            $0.price > $1.price
        }
        
        
        /// 遍历
        for product in products {
            print(product.name)
        }
        
        /// 遍历2 带下标
        for (index, product) in products.enumerated() {
            print(index)
            print(product.name)
        }
        
        
        /// 获取所有商品名称
        let names = products.map {
            $0.name
        }
        
        /// 累加
        let total = products.reduce(0) {
            $0 + $1.price
        }
    }
    
    
    /// 数组去重
    func arrayFilter()  {
        let nums = [1, 2, 2, 3, 4, 4, 5]
        
        var set = Set<Int>()
        let result = nums.filter {
            set.insert($0).inserted
        }
    }
    
}
