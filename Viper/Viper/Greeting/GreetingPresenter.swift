//
//  Untitled.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// GreetingPresenter.swift
protocol GreetingViewInput: AnyObject {
    func showGreeting(text: String)
}

protocol GreetingPresenterInput {
    func viewDidLoad()
    func didTapShowButton()
}

class GreetingPresenter: GreetingPresenterInput, GreetingInteractorOutput {

    weak var view: GreetingViewInput?
    var interactor: GreetingInteractorInput?

    func viewDidLoad() {}

    func didTapShowButton() {
        interactor?.getGreeting()
    }

    func didFetchGreeting(_ greeting: Greeting) {
        view?.showGreeting(text: greeting.message)
    }
}
