//
//  SplashViewController.swift
//  covid-19-graph
//

import UIKit

class SplashViewController: UIViewController {
    var coordinator: SplashCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.coordinator?.goToHome()
        }
    }
}
