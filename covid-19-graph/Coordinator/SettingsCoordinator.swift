//
//  SettingsCoordinator.swift
//  covid-19-graph
//

import UIKit

final class SettingsCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.settingsViewController)
        guard let settingsViewController = storyboard.instantiateInitialViewController() as? SettingsViewController else {
            fatalError("failed to SettingsViewController instantiate")
        }
        navigationController.pushViewController(settingsViewController, animated: false)
    }
}
