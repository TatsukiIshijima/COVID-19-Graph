//
//  RegionCoordinator.swift
//  covid-19-graph
//

import UIKit

final class RegionCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var prefecture: Prefecture

    init(navigationController: UINavigationController, prefecture: Prefecture) {
        self.navigationController = navigationController
        self.prefecture = prefecture
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.regionViewController)
        guard let regionViewController = storyboard.instantiateInitialViewController() as? RegionViewController else {
            fatalError("failed to RegionController instantiate")
        }
        regionViewController.coordinator = self
        regionViewController.prefecture = prefecture
        navigationController.pushViewController(regionViewController, animated: true)
    }
}
