//
//  GreetingRouter.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// GreetingRouter.swift
import UIKit

final class GreetingRouter {

    static func createModule() -> UIViewController {
        let view = GreetingViewController()
        let interactor = GreetingInteractor()
        let presenter = GreetingPresenter()

        // 注入依赖
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter

        return view
    }
}
