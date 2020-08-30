//
//  RegionViewController.swift
//  covid-19-graph
//

import Core
import UIKit

final class RegionViewController: UIViewController {
    private var regionDataViewController: RegionDataViewController?

    var region: RegionModel?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let viewController = regionDataViewController,
            let region = self.region
            else {
                fatalError("RegionDataViewController or RegionModel is nil.")
        }
        viewController.reloadData(prefectures: Array(region.prefectures.values))
    }
}

extension RegionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let regionDataViewController = segue.destination as? RegionDataViewController {
            self.regionDataViewController = regionDataViewController
        }
    }
}
