//
//  SplashViewController.swift
//  covid-19-graph
//

import UIKit

public protocol SplashViewControllerDelegate: AnyObject {
    func goToHome()
}

class SplashViewController: UIViewController {
    weak var delegate: SplashViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToHome(_ sender: Any) {
        guard let splashViewControllerDelegate = delegate else {
            print("splashViewControllerDelegate is nil.")
            return
        }
        splashViewControllerDelegate.goToHome()
    }
}
