//
//  HomeCoordinator.swift
//  covid-19-graph
//

import UIKit

final class HomeCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.homeViewController)
        guard let homeViewController = storyboard.instantiateInitialViewController() as? HomeViewController else {
            fatalError("failed to HomeViewController instantiate")
        }
        //        childCoordinators.forEach { coordinator in
        //            coordinator.start()
        //        }
        //        homeViewController.setViewControllers(childCoordinators.map { $0.viewController }, animated: false)
        homeViewController.modalPresentationStyle = .fullScreen
        navigationController.present(homeViewController, animated: true, completion: nil)
    }
}
