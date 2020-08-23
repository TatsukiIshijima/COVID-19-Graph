//
//  AppDelegate.swift
//  covid-19-graph
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let appContainer: AppContainer = AppContainer()
    var mainCoordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else {
            fatalError("Window is nil.")
        }

        // NavigationBarの背景色が薄くなってしまうのを防ぐ設定
        UINavigationBar.appearance().isTranslucent = false
        let navigationController = UINavigationController()
        mainCoordinator = AppCoordinator(navigationController: navigationController)
        mainCoordinator?.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return true
    }

    // MARK: UISceneSession Lifecycle

    /*
     func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
     // Called when a new scene session is being created.
     // Use this method to select a configuration to create the new scene with.
     return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
     }

     func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
     // Called when the user discards a scene session.
     // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
     // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     }
     */
}

extension AppDelegate {
    static var shared: AppDelegate {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cloud not get AppDelegate.")
        }
        return delegate
    }
}
