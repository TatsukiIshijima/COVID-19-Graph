//
//  PrefectureCoordinator.swift
//  covid-19-graph
//

import UIKit

final class PrefectureCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.prefectureViewController)
        guard let graphViewController = storyboard.instantiateInitialViewController() as? PrefectureViewController else {
            fatalError("failed to GraphViewController instantiate")
        }
        navigationController.pushViewController(graphViewController, animated: false)
    }
}
