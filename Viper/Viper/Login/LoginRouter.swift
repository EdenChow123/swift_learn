//
//  LoginRouter.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

import UIKit

final class LoginRouter {

    static func createModule() -> UIViewController {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter

        return view
    }

    static func navigateToHome(from view: UIViewController) {
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .green
        homeVC.title = "首页"

        view.navigationController?.pushViewController(homeVC, animated: true)
    }
}
