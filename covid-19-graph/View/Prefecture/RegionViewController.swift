//
//  RegionViewController.swift
//  covid-19-graph
//

import Core
import UIKit

final class RegionViewController: UIViewController {
    // 画面の横幅とTableViewの縦幅をイコールにすると高さ変更が効かなかったので
    // 一旦定数指定し、その後変更するようにする
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private var regionDataViewController: RegionDataViewController?

    var region: RegionModel?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewController = regionDataViewController,
            let region = self.region
            else {
                fatalError("RegionDataViewController or RegionModel is nil.")
        }
        tableViewHeight.constant = CGFloat(region.prefectures.count * 44)
        viewController.reloadData(prefectures: Array(region.prefectures.values.sorted(by: { (first, second) -> Bool in
            first.id < second.id
        })))
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
