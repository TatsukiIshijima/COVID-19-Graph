//
//  TotalTableViewCell.swift
//  covid-19-graph
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var unit: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    public func set(title: String, num: Int) {
        self.title.text = title
        self.num.text = num.toCommaSeperateString
    }
}
