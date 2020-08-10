//
//  SplashViewController.swift
//  covid-19-graph
//

import UIKit

protocol SplashViewControllerDelegate: class {
    func goToHome()
}

class SplashViewController: UIViewController {
    weak var delegate: SplashViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func goToHome(_ sender: Any) {
        delegate?.goToHome()
    }
}
