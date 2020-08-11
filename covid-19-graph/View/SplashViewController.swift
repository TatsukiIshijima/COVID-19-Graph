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

    @IBAction func goToHome(_ sender: Any) {
        coordinator?.goToHome()
    }
}
