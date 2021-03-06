//
//  TotalCoordinator.swift
//  covid-19-graph
//

import UIKit

final class TodayCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.todayViewController)
        guard let todayViewController = storyboard.instantiateInitialViewController() as? TodayViewController else {
            fatalError("failed to TodayViewController instantiate")
        }
        todayViewController.coordinator = self
        navigationController.pushViewController(todayViewController, animated: true)
    }
}
