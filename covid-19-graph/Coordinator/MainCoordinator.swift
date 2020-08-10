//
//  MainCoordinator.swift
//  covid-19-graph
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let child = SplashCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.start()
    }

    //
    //    func buySubscription() {
    //        let child = BuyCoordinator(navigationController: navigationController)
    //        child.parentCoordinator = self
    //        childCoordinators.append(child)
    //        child.start()
    //    }
    //
    //    func createAccount() {
    //        let vc = CreateAccountViewController.instantiate()
    //        vc.coordinator = self
    //        navigationController.pushViewController(vc, animated: true)
    //    }
    //
    //    // NavigationBar の Back Button イベント検知できる
    //    func childDidFinish(_ child: Coordinator?) {
    //        for (index, coordinator) in childCoordinators.enumerated() {
    //            if coordinator === child {
    //                childCoordinators.remove(at: index)
    //                break
    //            }
    //        }
    //        print("childDidFinish")
    //    }
    //
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        //        if let buyViewController = fromViewController as? BuyViewController {
        //            childDidFinish(buyViewController.coordinator)
        //        }
    }
}
