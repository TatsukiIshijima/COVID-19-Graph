//
//  TotalViewController.swift
//  covid-19-graph
//

import UIKit

final class TotalViewController: UIViewController {
    let positiveCellHeight: CGFloat = 88
    let totalCellHeight: CGFloat = 64

    @IBOutlet private weak var totalTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate is nil.")
        }

        appDelegate.appContainer.covid19Repository.fetchTotal().startWithResult { result in
            switch result {
            case let .success(total):
                print("Success \(total.date)")
            case let .failure(error):
                print("Error \(error)")
            }
        }

        totalTableView.delegate = self
        totalTableView.dataSource = self
        totalTableView.register(R.nib.totalTableViewCell)
    }
}

extension TotalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TotalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let totalTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.totalTableViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.totalTableViewCell)")
        }
        return totalTableViewCell
    }
}
