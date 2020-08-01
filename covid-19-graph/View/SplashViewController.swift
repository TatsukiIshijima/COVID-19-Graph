//
//  SplashViewController.swift
//  covid-19-graph
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToHome(_ sender: Any) {
        performSegue(withIdentifier: R.segue.splashViewController.goToHome, sender: nil)
    }
}
