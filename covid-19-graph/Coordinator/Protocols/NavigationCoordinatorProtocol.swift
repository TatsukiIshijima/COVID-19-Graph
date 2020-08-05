//
//  NavigationCoordinatorProtocol.swift
//  covid-19-graph
//

import UIKit

protocol NavigationCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController { get }
}

extension NavigationCoordinator {
    var viewController: UIViewController {
        return navigationController as UIViewController
    }
}
