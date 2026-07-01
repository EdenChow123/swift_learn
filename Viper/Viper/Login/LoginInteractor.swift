//
//  LoginInteractor.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// LoginInteractorProtocols.swift

import Foundation

protocol LoginInteractorInput: AnyObject {
    func login(username: String, password: String)
}

protocol LoginInteractorOutput: AnyObject {
    func loginSuccess(_ response: LoginResponse)
    func loginFailure(_ error: Error)
}

// LoginInteractor.swift

final class LoginInteractor: LoginInteractorInput {

    weak var output: LoginInteractorOutput?

    func login(username: String, password: String) {

        // 1. 基础校验（业务规则）
        guard !username.isEmpty, !password.isEmpty else {
            output?.loginFailure(NSError(
                domain: "Login",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "用户名或密码不能为空"]
            ))
            return
        }

        // 2. 模拟网络请求
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            // 模拟成功
            let response = LoginResponse(
                token: "abc123",
                userId: "user_001"
            )

            DispatchQueue.main.async {
                self.output?.loginSuccess(response)
            }
        }
    }
}
