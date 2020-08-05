//
//  AppCoordinator.swift
//  covid-19-graph
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let rootCordinator: CoordinatorProtocol

    init(window: UIWindow, coordinator: CoordinatorProtocol) {
        self.window = window
        rootCordinator = coordinator
    }

    func start() {
        rootCordinator.start()
        window.rootViewController = rootCordinator.viewController
        window.makeKeyAndVisible()
    }
}
