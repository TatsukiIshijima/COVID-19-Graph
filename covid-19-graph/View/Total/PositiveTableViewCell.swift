//
//  PositiveTableViewCell.swift
//  covid-19-graph
//

import UIKit

class PositiveTableViewCell: UITableViewCell {
    @IBOutlet private weak var numLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func setNum(positiveNum: Int) {
        numLabel.text = positiveNum.toCommaSeperateString
    }
}

extension Int {
    var toCommaSeperateString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(for: self) ?? ""
    }
}
