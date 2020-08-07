//
//  BarGrapheCollectionViewCell.swift
//  covid-19-graph
//

import Charts
import UIKit

class BarGrapheCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var barChartView: BarChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func settingChart() {
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

    func setChart() {
        settingChart()

        // Y軸データ
        let rawData: [Int] = [20, 50, 70, 30, 60, 90, 40]

        let dataEntries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }

        // グラフセット
        let chartDataSet = BarChartDataSet(entries: dataEntries)
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [.systemBlue]
        let chartData = BarChartData(dataSet: chartDataSet)

        barChartView.data = chartData
    }
}
