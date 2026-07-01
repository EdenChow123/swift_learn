//
//  LoginPresenter.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// LoginPresenter.swift

// LoginPresenterProtocols.swift

import Foundation

protocol LoginViewInput: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
    func enableLoginButton(_ enabled: Bool)
}

protocol LoginPresenterInput {
    func didTapLogin(username: String, password: String)
}

final class LoginPresenter: LoginPresenterInput, LoginInteractorOutput {

    weak var view: LoginViewInput?
    var interactor: LoginInteractorInput?

    func didTapLogin(username: String, password: String) {
        view?.enableLoginButton(false)
        view?.showLoading()

        interactor?.login(username: username, password: password)
    }

    func loginSuccess(_ response: LoginResponse) {
        view?.hideLoading()
        view?.enableLoginButton(true)

        // 登录成功 → 跳转由 Router 负责
        // Presenter 不直接 push
        print("登录成功，token:", response.token)
    }

    func loginFailure(_ error: Error) {
        view?.hideLoading()
        view?.enableLoginButton(true)
        view?.showError(error.localizedDescription)
    }
}
