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
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 44
        tableView.register(UINib(resource: R.nib.regionDataHeaderView), forHeaderFooterViewReuseIdentifier: R.nib.regionDataHeaderView.name)
        tableView.register(R.nib.regionDataTableViewCell)
    }

    func reloadData(prefectures: [PrefectureModel]) {
        self.prefectures = prefectures
        tableView.reloadData()
    }
}

extension RegionDataViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.regionDataHeaderView.name) as? RegionDataHeaderView else {
            fatalError("RegionDataHeaderView is nil.")
        }
        return header
    }
}

extension RegionDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.regionDataTableViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.regionDataTableViewCell)")
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = R.color.primaryColor()?.withAlphaComponent(0.1)
        }
        // 下線の左余白をなくす
        cell.separatorInset = .zero
        cell.setContent(prefecture: prefectures[indexPath.row])
        return cell
    }
}
