//
//  TotalCoordinator.swift
//  covid-19-graph
//

import UIKit

final class TotalCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.totalViewController)
        guard let totalViewController = storyboard.instantiateInitialViewController() as? TotalViewController else {
            fatalError("failed to TotalViewController instantiate")
        }
        navigationController.pushViewController(totalViewController, animated: true)
    }
}
