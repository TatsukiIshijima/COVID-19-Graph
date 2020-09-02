//
//  ChubuMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class ChubuMapView: DrawMapView {
    private var yamanashiColor = R.color.dangerColor7()!
    private var nigataColor = R.color.dangerColor7()!
    private var shizuokaColor = R.color.dangerColor7()!
    private var naganoColor = R.color.dangerColor7()!
    private var aichiColor = R.color.dangerColor7()!
    private var gifuColor = R.color.dangerColor7()!
    private var toyamaColor = R.color.dangerColor7()!
    private var ishikawaColor = R.color.dangerColor7()!
    private var fukuiColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 200
        originalHeight = 200
        super.draw(rect)

        yamanashiColor.setFill()
        Chubu.yamanashi.path.fill()
        drawPath(path: Chubu.yamanashi.path)

        nigataColor.setFill()
        Chubu.nigata.path.fill()
        drawPath(path: Chubu.nigata.path)

        shizuokaColor.setFill()
        Chubu.shizuoka.path.fill()
        drawPath(path: Chubu.shizuoka.path)

        naganoColor.setFill()
        Chubu.nagano.path.fill()
        drawPath(path: Chubu.nagano.path)

        aichiColor.setFill()
        Chubu.aichi.path.fill()
        drawPath(path: Chubu.aichi.path)

        gifuColor.setFill()
        Chubu.gifu.path.fill()
        drawPath(path: Chubu.gifu.path)

        toyamaColor.setFill()
        Chubu.toyama.path.fill()
        drawPath(path: Chubu.toyama.path)

        ishikawaColor.setFill()
        Chubu.ishikawa.path.fill()
        drawPath(path: Chubu.ishikawa.path)

        fukuiColor.setFill()
        Chubu.fukui.path.fill()
        drawPath(path: Chubu.fukui.path)

        context?.restoreGState()
    }

    func reDraw(yamanashiColor: UIColor = R.color.dangerColor7()!,
                nigataColor: UIColor = R.color.dangerColor7()!,
                shizuokaColor: UIColor = R.color.dangerColor7()!,
                naganoColor: UIColor = R.color.dangerColor7()!,
                aichiColor: UIColor = R.color.dangerColor7()!,
                gifuColor: UIColor = R.color.dangerColor7()!,
                toyamaColor: UIColor = R.color.dangerColor7()!,
                ishikawaColor: UIColor = R.color.dangerColor7()!,
                fukuiColor: UIColor = R.color.dangerColor7()!) {
        self.yamanashiColor = yamanashiColor
        self.nigataColor = nigataColor
        self.shizuokaColor = shizuokaColor
        self.naganoColor = naganoColor
        self.aichiColor = aichiColor
        self.gifuColor = gifuColor
        self.toyamaColor = toyamaColor
        self.ishikawaColor = ishikawaColor
        self.fukuiColor = fukuiColor
        setNeedsDisplay()
    }
}
