//
//  TotalViewController.swift
//  covid-19-graph
//

import UIKit

final class TodayViewController: UIViewController {
    @IBOutlet private weak var totalTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
         fatalError("AppDelegate is nil.")
         }

         appDelegate.appContainer.covid19Repository.fetchTotal().startWithResult { result in
         switch result {
         case let .success(total):
         print("FetchTotal Success \(total.date)")
         case let .failure(error):
         print("FetchTotal Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchTotalHistory().startWithResult { result in
         switch result {
         case let .success(totalHistory):
         print("FetchTotalHistory Success \(totalHistory.history.count)")
         case let .failure(error):
         print("FetchTotalHistory Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchTotalPrediction().startWithResult { result in
         switch result {
         case let .success(totalPrediction):
         print("FetchTotalPrediction Success \(totalPrediction.total.count)")
         case let .failure(error):
         print("FetchTotalPrediction Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchStatistics().startWithResult { result in
         switch result {
         case let .success(prefecture):
         print("FetchStatistics Success \(prefecture.all.count) \(prefecture.all[0].male.generationsCount.generation00s)")
         case let .failure(error):
         print("FetchStatistics Error \(error)")
         }
         }
         */

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController?.navigationBar.barTintColor = UIColor(named: R.color.mainColor.name)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        totalTableView.delegate = self
        totalTableView.dataSource = self
        totalTableView.register(R.nib.totalTableViewCell)
        totalTableView.register(R.nib.totalHistoryTableViewCell)
        totalTableView.register(R.nib.todayTableViewCell)
        totalTableView.register(UINib(resource: R.nib.totalHeaderView), forHeaderFooterViewReuseIdentifier: R.nib.totalHeaderView.name)
        totalTableView.register(UINib(resource: R.nib.totalFooterView), forHeaderFooterViewReuseIdentifier: R.nib.totalFooterView.name)
    }
}

extension TodayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let totalHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.totalHeaderView.name) as? TotalHeaderView else {
            fatalError("failed to dequeue with \(R.nib.totalHeaderView.name)")
        }
        switch section {
        case 0:
            totalHeaderView.setTitle(title: "本日の状況")
            return totalHeaderView
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let totalFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.totalFooterView.name) as? TotalFooterView else {
            fatalError("failed to dequeue with \(R.nib.totalFooterView.name)")
        }
        return section == 0 ? totalFooterView : nil
    }
}

extension TodayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let todayTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.todayTableViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.todayTableViewCell)")
        }
        if let main = R.color.mainColor() {
            todayTableViewCell.setContent(backgroundColor: main, num: 124_500, title: "感染者")
        }
        return todayTableViewCell
    }
}
