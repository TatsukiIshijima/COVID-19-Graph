//
//  AppCoordinator.swift
//  covid-19-graph
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    private let rootViewController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()

        let storyboard = UIStoryboard(resource: R.storyboard.splashViewController)
        guard let splashViewController = storyboard.instantiateInitialViewController() as? SplashViewController else {
            return
        }
        rootViewController.setNavigationBarHidden(true, animated: false)
        rootViewController.pushViewController(splashViewController, animated: false)
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
