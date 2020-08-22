//
//  HomeViewController.swift
//  covid-19-graph
//

import Core
import UIKit

class HomeViewController: UITabBarController {
    private let tabIconSystemName = ["calendar", "map", "gear"]
    private let tabItemName = [R.string.localizable.todayTitle(), R.string.localizable.prefectureTitle(), "設定"]

    var coordinator: HomeCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        UITabBar.appearance().tintColor = R.color.primaryColor()!

        setTabItems()
    }

    private func setTabItems() {
        if let tabBarItems = tabBar.items {
            for (index, item) in tabBarItems.enumerated() {
                item.image = UIImage(systemName: tabIconSystemName[index])
                item.title = tabItemName[index]
            }
        }
    }
}

extension HomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // print("didSelect selectedIndex=\(selectedIndex)")
    }
}
