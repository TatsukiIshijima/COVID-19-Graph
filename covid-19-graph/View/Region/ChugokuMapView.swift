//
//  ChugokuMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class ChugokuMapView: DrawMapView {
    private var shimaneColor = R.color.dangerColor7()!
    private var tottoriColor = R.color.dangerColor7()!
    private var okayamaColor = R.color.dangerColor7()!
    private var hiroshimaColor = R.color.dangerColor7()!
    private var yamaguchiColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 260
        originalHeight = 260
        super.draw(rect)

        context?.saveGState()
        context?.translateBy(x: -113.38, y: -615.69)
        context?.scaleBy(x: 2, y: 2)

        shimaneColor.setFill()
        Chugoku.shimane.path.fill()
        drawPath(path: Chugoku.shimane.path)

        tottoriColor.setFill()
        Chugoku.tottori.path.fill()
        drawPath(path: Chugoku.tottori.path)

        okayamaColor.setFill()
        Chugoku.okayama.path.fill()
        drawPath(path: Chugoku.okayama.path)

        hiroshimaColor.setFill()
        Chugoku.hiroshima.path.fill()
        drawPath(path: Chugoku.hiroshima.path)

        yamaguchiColor.setFill()
        Chugoku.yamaguchi.path.fill()
        drawPath(path: Chugoku.yamaguchi.path)

        context?.restoreGState()
    }

    func reDraw(shimaneColor: UIColor = R.color.dangerColor7()!,
                tottoriColor: UIColor = R.color.dangerColor7()!,
                okayamaColor: UIColor = R.color.dangerColor7()!,
                hiroshimaColor: UIColor = R.color.dangerColor7()!,
                yamaguchiColor: UIColor = R.color.dangerColor7()!) {
        self.shimaneColor = shimaneColor
        self.tottoriColor = tottoriColor
        self.okayamaColor = okayamaColor
        self.hiroshimaColor = hiroshimaColor
        self.yamaguchiColor = yamaguchiColor
        setNeedsDisplay()
    }
}
