//
//  TotalCollectionViewCell.swift
//  covid-19-graph
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet private weak var positiveNum: UILabel!
    @IBOutlet weak var PCRNum: UILabel!
    @IBOutlet weak var hospitalizeNum: UILabel!
    @IBOutlet weak var severeNum: UILabel!
    @IBOutlet weak var dischargeNum: UILabel!
    @IBOutlet weak var deathNum: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
