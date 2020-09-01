//
//  ShikokuMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class ShikokuMapView: DrawMapView {
    private var kagawaColor = R.color.dangerColor7()!
    private var tokushimaColor = R.color.dangerColor7()!
    private var kochiColor = R.color.dangerColor7()!
    private var ehimeColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 200
        originalHeight = 200
        super.draw(rect)

        context?.saveGState()
        context?.translateBy(x: -176.38, y: -741.69)
        context?.scaleBy(x: 2, y: 2)

        kagawaColor.setFill()
        Shikoku.kagawa.path.fill()
        drawPath(path: Shikoku.kagawa.path)

        tokushimaColor.setFill()
        Shikoku.tokushima.path.fill()
        drawPath(path: Shikoku.tokushima.path)

        kochiColor.setFill()
        Shikoku.kochi.path.fill()
        drawPath(path: Shikoku.kochi.path)

        ehimeColor.setFill()
        Shikoku.ehime.path.fill()
        drawPath(path: Shikoku.ehime.path)

        context?.restoreGState()
    }
}
