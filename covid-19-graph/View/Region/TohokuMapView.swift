//
//  TohokuMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class TohokuMapView: DrawMapView {
    private var aomoriColor = R.color.dangerColor7()!
    private var akitaColor = R.color.dangerColor7()!
    private var iwateColor = R.color.dangerColor7()!
    private var yamagataColor = R.color.dangerColor7()!
    private var miyagiColor = R.color.dangerColor7()!
    private var fukushimaColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 185
        originalHeight = 235
        super.draw(rect)

        aomoriColor.setFill()
        Tohoku.aomori.path.fill()
        drawPath(path: Tohoku.aomori.path)

        akitaColor.setFill()
        Tohoku.akita.path.fill()
        drawPath(path: Tohoku.akita.path)

        iwateColor.setFill()
        Tohoku.iwate.path.fill()
        drawPath(path: Tohoku.iwate.path)

        yamagataColor.setFill()
        Tohoku.yamagata.path.fill()
        drawPath(path: Tohoku.yamagata.path)

        miyagiColor.setFill()
        Tohoku.miyagi.path.fill()
        drawPath(path: Tohoku.miyagi.path)

        fukushimaColor.setFill()
        Tohoku.fukushima.path.fill()
        drawPath(path: Tohoku.fukushima.path)

        context?.restoreGState()
    }

    func reDraw(aomoriColor: UIColor = R.color.dangerColor7()!,
                akitaColor: UIColor = R.color.dangerColor7()!,
                iwateColor: UIColor = R.color.dangerColor7()!,
                yamagataColor: UIColor = R.color.dangerColor7()!,
                miyagiColor: UIColor = R.color.dangerColor7()!,
                fukushimaColor: UIColor = R.color.dangerColor7()!) {
        self.aomoriColor = aomoriColor
        self.akitaColor = akitaColor
        self.iwateColor = iwateColor
        self.yamagataColor = yamagataColor
        self.miyagiColor = miyagiColor
        self.fukushimaColor = fukushimaColor
        setNeedsDisplay()
    }
}
