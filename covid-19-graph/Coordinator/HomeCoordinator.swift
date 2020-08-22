//
//  HomeCoordinator.swift
//  covid-19-graph
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(resource: R.storyboard.homeViewController)
        guard let homeViewController = storyboard.instantiateInitialViewController() as? HomeViewController else {
            fatalError("failed to HomeViewController instantiate")
        }
        let todayCoordinator = TodayCoordinator(navigationController: UINavigationController())
        let prefectureCoordinator = PrefectureCoordinator(navigationController: UINavigationController())
        todayCoordinator.start()
        prefectureCoordinator.start()
        homeViewController.coordinator = self
        homeViewController.setViewControllers([todayCoordinator.navigationController, prefectureCoordinator.navigationController], animated: false)
        homeViewController.modalPresentationStyle = .fullScreen
        navigationController.present(homeViewController, animated: true, completion: nil)
    }
}
