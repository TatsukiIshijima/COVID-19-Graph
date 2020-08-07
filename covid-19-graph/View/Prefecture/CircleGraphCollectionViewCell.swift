//
//  CircleGraphCollectionViewCell.swift
//  covid-19-graph
//

import Charts
import UIKit

class CircleGraphCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var pieChartView: PieChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setPieChartData() {}

    private func setPieChartAppearance() {
        pieChartView.centerText = "年代"
    }
}
