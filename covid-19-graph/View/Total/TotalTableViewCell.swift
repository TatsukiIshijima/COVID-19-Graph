//
//  TotalTableViewCell.swift
//  covid-19-graph
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var unit: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
