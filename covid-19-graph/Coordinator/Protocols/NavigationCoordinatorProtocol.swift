//
//  NavigationCoordinatorProtocol.swift
//  covid-19-graph
//

import UIKit

protocol NavigationCordinator: CoordinatorProtocol {
    var navigationController: UINavigationController { get }
}

extension NavigationCordinator {
    var viewController: UIViewController {
        return navigationController as UIViewController
    }
}
