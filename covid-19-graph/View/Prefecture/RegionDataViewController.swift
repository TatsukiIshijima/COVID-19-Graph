//
//  RegionDataTableViewController.swift
//  covid-19-graph
//

import Core
import UIKit

class RegionDataViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    private var prefectures: [PrefectureModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.regionDataTableViewCell)
    }

    func reloadData(prefectures: [PrefectureModel]) {
        self.prefectures = prefectures
        tableView.reloadData()
    }
}

extension RegionDataViewController: UITableViewDelegate {}

extension RegionDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.regionDataTableViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.regionDataTableViewCell)")
        }
        cell.setContent(prefecture: prefectures[indexPath.row])
        return cell
    }
}
