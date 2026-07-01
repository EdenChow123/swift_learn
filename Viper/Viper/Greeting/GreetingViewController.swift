//
//  GreetingViewController.swift
//  Viper
//
//  Created by Eden on 2026/7/1.
//

// GreetingView.swift
import UIKit

class GreetingViewController: UIViewController, GreetingViewInput {

    var presenter: GreetingPresenterInput?

    private let label = UILabel()
    private let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        label.text = "Press the button"
        label.textAlignment = .center

        button.setTitle("Show Greeting", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)

        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func tap() {
        presenter?.didTapShowButton()
    }

    func showGreeting(text: String) {
        label.text = text
    }
}
