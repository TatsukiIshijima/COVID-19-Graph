//
//  SplashCoordinator.swift
//  covid-19-graph
//

import UIKit

final class SplashCoordinator: NavigationCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.splashViewController)
        guard let splashViewController = storyboard.instantiateInitialViewController() as? SplashViewController else {
            return
        }
        splashViewController.delegate = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(splashViewController, animated: false)
    }
}

extension SplashCoordinator: SplashViewControllerDelegate {
    func goToHome() {}
}
