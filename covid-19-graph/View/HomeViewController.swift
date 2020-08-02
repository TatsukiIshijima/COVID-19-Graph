//
//  HomeViewController.swift
//  covid-19-graph
//

import UIKit

class HomeViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        appDelegate.appContainer?.covid19Repository.fetchTotal().startWithResult { result in
            switch result {
            case let .success(total):
                print("Success \(total.date)")
            case let .failure(error):
                print("Error \(error)")
            }
        }
    }
}
