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
        totalTableView.register(UINib(nibName: R.nib.totalTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.totalTableViewCell.identifier)
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
        guard let totalTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.nib.totalTableViewCell, for: indexPath) else {
            fatalError("failed dequeueResuableCell with \(R.nib.totalTableViewCell.identifier)")
        }
        return totalTableViewCell
    }
}
