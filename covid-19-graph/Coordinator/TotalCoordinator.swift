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
            return
        }
        print("TotalCoordinator start() called.")
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(totalViewController, animated: true)
    }
}
