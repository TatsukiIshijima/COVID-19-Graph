//
//  RegionCoordinator.swift
//  covid-19-graph
//

import UIKit

final class RegionCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.regionViewController)
        guard let regionViewController = storyboard.instantiateInitialViewController() as? RegionViewController else {
            fatalError("failed to RegionController instantiate")
        }
        regionViewController.coordinator = self
        navigationController.pushViewController(regionViewController, animated: true)
    }
}
