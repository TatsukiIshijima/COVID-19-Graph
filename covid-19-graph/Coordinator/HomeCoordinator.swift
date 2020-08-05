//
//  HomeCoordinator.swift
//  covid-19-graph
//

import UIKit

final class HomeCoordinator: TabBarCoordinator {
    let tabBarController: UITabBarController
    private let childCoordinators: [CoordinatorProtocol]

    init(tabBarController: UITabBarController, childCoordinators: [CoordinatorProtocol]) {
        self.tabBarController = tabBarController
        self.childCoordinators = childCoordinators
    }

    func start() {
        childCoordinators.forEach { coordinator in
            coordinator.start()
        }
        let storyboard = UIStoryboard(resource: R.storyboard.homeViewController)
        guard let homeViewController = storyboard.instantiateInitialViewController() as? HomeViewController else {
            return
        }
        print("HomeCoordinator start() called.")
        homeViewController.setViewControllers(childCoordinators.map { $0.viewController }, animated: false)
    }
}
