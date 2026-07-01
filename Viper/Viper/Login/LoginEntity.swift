//
//  LoginEntity.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// LoginEntity.swift

struct LoginRequest {
    let username: String
    let password: String
}

struct LoginResponse {
    let token: String
    let userId: String
}
