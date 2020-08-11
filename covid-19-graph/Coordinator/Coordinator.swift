//
//  Coordinator.swift
//  covid-19-graph
//

import UIKit

// 参考
// https://medium.com/better-programming/leverage-the-coordinator-design-pattern-in-swift-5-cd5bb9e78e12
// https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
