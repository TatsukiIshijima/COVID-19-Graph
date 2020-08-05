//
//  SplashCoordinator.swift
//  covid-19-graph
//

import UIKit

final class SplashCoordinator: NavigationCoordinator {
    let navigationController: UINavigationController

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
        // navigationController.present(splashViewController, animated: true, completion: nil)
    }
}

extension SplashCoordinator: SplashViewControllerDelegate {
    func goToHome() {
        print("goToHome")

        /*
         let totalCoordinator = TotalCoordinator(navigationController: navigationController)
         let graphCoordinator = GraphCoordinator(navigationController: navigationController)
         let settingsCoordinator = SettingsCoordinator(navigationController: navigationController)
         let homeCoordinator = HomeCoordinator(tabBarController: UITabBarController(), childCoordinators: [totalCoordinator, graphCoordinator, settingsCoordinator])
         totalCoordinator.start()
         */
        let graphCoordinator = GraphCoordinator(navigationController: navigationController)
        graphCoordinator.start()
    }
}
