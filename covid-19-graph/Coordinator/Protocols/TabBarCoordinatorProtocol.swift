//
//  TabBarCoordinator.swift
//  covid-19-graph
//

import UIKit

protocol TabBarCoordinator: CoordinatorProtocol {
    var tabBarController: UITabBarController { get }
}

extension TabBarCoordinator {
    var viewController: UIViewController {
        return tabBarController as UIViewController
    }
}
