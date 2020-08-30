//
//  RegionDataHeaderView.swift
//  covid-19-graph
//

import UIKit

final class RegionDataHeaderView: UITableViewHeaderFooterView {
    @IBOutlet private weak var primaryText: UILabel!
    @IBOutlet private weak var secondaryText: UILabel!
    @IBOutlet weak var tertiaryText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        primaryText.text = "累計\n感染者"
        secondaryText.text = "新規\n感染者"
        tertiaryText.text = "PCR\n検査"
    }
}
