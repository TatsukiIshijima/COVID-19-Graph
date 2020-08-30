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

        primaryText.text = R.string.localizable.totalPositivesTitle()
        secondaryText.text = R.string.localizable.newPositivesTitle()
        tertiaryText.text = R.string.localizable.pcrTitle()
    }
}
