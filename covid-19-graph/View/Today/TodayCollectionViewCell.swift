//
//  TodayCollectionViewCell.swift
//  covid-19-graph
//

import UIKit

class TodayCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var numLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setContent(backgroundColor: UIColor, num: Int, title: String) {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10.0

        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.5

        contentView.backgroundColor = backgroundColor
        numLabel.textColor = .white
        numLabel.text = num.toCommaSeperateString
        titleLabel.textColor = .white
        titleLabel.text = title
    }
}
