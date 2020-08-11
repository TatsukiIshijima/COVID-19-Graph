//
//  RegionViewController.swift
//  covid-19-graph
//

import UIKit

class RegionViewController: UIViewController {
    var prefecture: Prefecture?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController?.navigationBar.barTintColor = UIColor(named: R.color.primaryColor.name)
        navigationController?.navigationBar.tintColor = .white
        // navigationController?.navigationBar.prefersLargeTitles = true
        // navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        if let prefecture = self.prefecture {
            print("\(prefecture)")
        }
    }
}
