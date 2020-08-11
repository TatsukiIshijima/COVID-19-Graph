//
//  HomeViewController.swift
//  covid-19-graph
//

import Core
import UIKit

class HomeViewController: UITabBarController {
    private let tabIconSystemName = ["house", "map", "gear"]

    var coordinator: HomeCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        setTabItems()
    }

    private func setTabItems() {
        if let tabBarItems = tabBar.items {
            for (index, item) in tabBarItems.enumerated() {
                item.image = UIImage(systemName: tabIconSystemName[index])
            }
        }
    }
}

extension HomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("didSelect selectedIndex=\(selectedIndex)")
    }
}
