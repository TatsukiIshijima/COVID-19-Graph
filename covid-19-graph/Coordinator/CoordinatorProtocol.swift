//
//  Coordinator.swift
//  covid-19-graph
//

import UIKit

protocol CoordinatorProtocol {
    var viewController: UIViewController { get }
    func start()
}
