//
//  PrefectureCoordinator.swift
//  covid-19-graph
//

import Core
import UIKit

final class PrefectureCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.prefectureViewController)
        guard let prefectureViewController = storyboard.instantiateInitialViewController() as? PrefectureViewController else {
            fatalError("failed to PrefectureViewController instantiate")
        }
        prefectureViewController.coordinator = self
        navigationController.pushViewController(prefectureViewController, animated: false)
    }

    func goToRegion(region: RegionModel) {
        let regionCoordinator = RegionCoordinator(navigationController: navigationController, region: region)
        regionCoordinator.start()
    }
}
