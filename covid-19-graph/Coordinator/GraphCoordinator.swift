//
//  GraphCoordinator.swift
//  covid-19-graph
//

import UIKit

final class GraphCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.graphViewController)
        guard let graphViewController = storyboard.instantiateInitialViewController() as? GraphViewController else {
            return
        }
        print("GraphCoordinator start() called.")
        // navigationController.pushViewController(graphViewController, animated: false)
        graphViewController.modalPresentationStyle = .fullScreen
        navigationController.present(graphViewController, animated: true, completion: nil)
    }
}
