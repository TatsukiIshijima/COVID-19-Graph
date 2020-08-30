//
//  RegionCoordinator.swift
//  covid-19-graph
//

import Core
import UIKit

final class RegionCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var region: RegionModel

    init(navigationController: UINavigationController, region: RegionModel) {
        self.navigationController = navigationController
        self.region = region
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.regionViewController)
        guard let regionViewController = storyboard.instantiateInitialViewController() as? RegionViewController else {
            fatalError("failed to RegionController instantiate")
        }
        regionViewController.coordinator = self
        regionViewController.region = region
        navigationController.pushViewController(regionViewController, animated: true)
    }
}
