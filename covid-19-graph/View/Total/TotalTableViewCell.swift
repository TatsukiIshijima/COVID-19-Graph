//
//  TotalCollectionViewCell.swift
//  covid-19-graph
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet private weak var positiveNum: UILabel!
    @IBOutlet private weak var PCRNum: UILabel!
    @IBOutlet private weak var hospitalizeNum: UILabel!
    @IBOutlet private weak var severeNum: UILabel!
    @IBOutlet private weak var dischargeNum: UILabel!
    @IBOutlet private weak var deathNum: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
