//
//  TodayCollectionViewCell.swift
//  covid-19-graph
//

import Charts
import UIKit

class TodayCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var barChartView: BarChartView!
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

        barChartView.backgroundColor = backgroundColor

        setBarChartAppearance()
        setBarChartData()
    }

    private func setBarChartData() {
        // Y軸データ
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40, 55, 60, 65, 70, 75, 100]

        let dataEntries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }

        // グラフセット
        let chartDataSet = BarChartDataSet(entries: dataEntries)
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [.white]
        let chartData = BarChartData(dataSet: chartDataSet)

        barChartView.data = chartData
    }

    private func setBarChartAppearance() {
        // 凡例の設定
        barChartView.legend.enabled = false

        // X軸の線の設定
        barChartView.xAxis.drawAxisLineEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        // X軸の数値ラベル設定
        barChartView.xAxis.drawLabelsEnabled = false

        // Y軸（左）の線の設定
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        // Y軸（右）の線の設定
        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false

        barChartView.isUserInteractionEnabled = false
    }
}
