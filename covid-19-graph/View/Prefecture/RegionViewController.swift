//
//  RegionViewController.swift
//  covid-19-graph
//

import Core
import UIKit

class RegionViewController: UIViewController {
    var region: RegionModel?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let region = self.region {
            print("\(region)")
        }
    }
}
