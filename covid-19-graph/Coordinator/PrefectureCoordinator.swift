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
        guard let prefectureViewController = storyboard.instantiateInitialViewController() as? PrefectureViewController else {
            fatalError("failed to PrefectureViewController instantiate")
        }
        prefectureViewController.delegate = self
        navigationController.pushViewController(prefectureViewController, animated: false)
    }
}

extension PrefectureCoordinator: PrefectureViewControllerDelegate {
    func goToRegion(prefecture: Prefecture) {
        print("goToRegion: \(prefecture)")
        let regionCoordinator = RegionCoordinator(navigationController: navigationController)
        regionCoordinator.start()
    }
}
