//
//  GreetingInteractor.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

protocol GreetingInteractorInput: AnyObject {
    func getGreeting()
}

protocol GreetingInteractorOutput: AnyObject {
    func didFetchGreeting(_ greeting: Greeting)
}

class GreetingInteractor: GreetingInteractorInput {
    weak var output: GreetingInteractorOutput?

    func getGreeting() {
        let greeting = Greeting(message: "Hello, VIPER!")
        output?.didFetchGreeting(greeting)
    }
}
