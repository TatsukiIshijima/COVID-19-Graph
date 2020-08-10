//
//  SplashCoordinator.swift
//  covid-19-graph
//

import UIKit

final class SplashCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.splashViewController)
        guard let splashViewController = storyboard.instantiateInitialViewController() as? SplashViewController else {
            fatalError("failed to SplashViewController instantiate")
        }
        // splashViewController.delegate = self
        splashViewController.coordinator = self
        navigationController.pushViewController(splashViewController, animated: false)
    }
}

// extension SplashCoordinator: SplashViewControllerDelegate {
//    func goToHome() {
//        let todayCoordinator = TodayCoordinator(navigationController: UINavigationController())
//        let prefectureCoordinator = PrefectureCoordinator(navigationController: UINavigationController())
//        let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
//        let homeCoordinator = HomeCoordinator(navigationController: navigationController, childCoordinators: [todayCoordinator, prefectureCoordinator, settingsCoordinator])
//        homeCoordinator.start()
//    }
// }
