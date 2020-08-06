//
//  TodayTableViewCell.swift
//  covid-19-graph
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var numLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setContent(backgroundColor: UIColor, num: Int, title: String) {
        view.backgroundColor = backgroundColor
        numLabel.text = num.toCommaSeperateString
        numLabel.textColor = .white
        titleLabel.text = title
        titleLabel.textColor = .white
    }
}
