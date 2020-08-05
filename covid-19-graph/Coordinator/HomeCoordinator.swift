//
//  HomeCoordinator.swift
//  covid-19-graph
//

import UIKit

final class HomeCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController
    private let childCoordinators: [CoordinatorProtocol]

    init(navigationController: UINavigationController, childCoordinators: [CoordinatorProtocol]) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.homeViewController)
        guard let homeViewController = storyboard.instantiateInitialViewController() as? HomeViewController else {
            fatalError("failed to HomeViewController instantiate")
        }
        childCoordinators.forEach { coordinator in
            coordinator.start()
        }
        homeViewController.setViewControllers(childCoordinators.map { $0.viewController }, animated: false)
        homeViewController.modalPresentationStyle = .fullScreen
        navigationController.present(homeViewController, animated: true, completion: nil)
    }
}
