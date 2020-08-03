//
//  TotalViewController.swift
//  covid-19-graph
//

import UIKit

final class TotalViewController: UIViewController {
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
        totalTableView.register(R.nib.positiveTableViewCell)
    }
}

extension TotalViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension TotalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let positiveTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.positiveTableViewCell, for: indexPath) else {
                fatalError("failed dequeueResuableCell with  \(R.reuseIdentifier.positiveTableViewCell)")
            }
            return positiveTableViewCell
        default:
            guard let totalTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.totalTableViewCell, for: indexPath) else {
                fatalError("failed dequeueResuableCell with \(R.reuseIdentifier.totalTableViewCell.identifier)")
            }
            return totalTableViewCell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 88
        default:
            return 64
        }
    }
}
