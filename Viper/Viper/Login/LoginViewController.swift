//
//  LoginViewController.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// LoginViewController.swift

import UIKit

final class LoginViewController: UIViewController, LoginViewInput {

    var presenter: LoginPresenterInput?

    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        usernameField.placeholder = "用户名"
        passwordField.placeholder = "密码"
        passwordField.isSecureTextEntry = true

        loginButton.setTitle("登录", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [
            usernameField,
            passwordField,
            loginButton,
            loadingIndicator
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }

    @objc private func loginTapped() {
        presenter?.didTapLogin(
            username: usernameField.text ?? "",
            password: passwordField.text ?? ""
        )
    }

    func showLoading() {
        loadingIndicator.startAnimating()
    }

    func hideLoading() {
        loadingIndicator.stopAnimating()
    }

    func showError(_ message: String) {
        let alert = UIAlertController(title: "错误", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default))
        present(alert, animated: true)
    }

    func enableLoginButton(_ enabled: Bool) {
        loginButton.isEnabled = enabled
    }
}
