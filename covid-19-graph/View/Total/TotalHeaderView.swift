//
//  TotalHeaderView.swift
//  covid-19-graph
//

import UIKit

class TotalHeaderView: UITableViewHeaderFooterView {
    @IBOutlet private weak var title: UILabel!

    func setTitle(title: String) {
        self.title.text = title
    }
}
