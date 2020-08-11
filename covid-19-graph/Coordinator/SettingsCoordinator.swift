//
//  SettingsCoordinator.swift
//  covid-19-graph
//

import UIKit

final class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.settingsViewController)
        guard let settingsViewController = storyboard.instantiateInitialViewController() as? SettingsViewController else {
            fatalError("failed to SettingsViewController instantiate")
        }
        settingsViewController.coordinator = self
        navigationController.pushViewController(settingsViewController, animated: false)
    }
}
