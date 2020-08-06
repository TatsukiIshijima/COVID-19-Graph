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

        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10.0

        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2, height: 4)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.5
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
