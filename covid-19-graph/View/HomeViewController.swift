//
//  HomeViewController.swift
//  covid-19-graph
//

import UIKit

class HomeViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
}

extension HomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelect selectedIndex=\(selectedIndex)")
    }
}
