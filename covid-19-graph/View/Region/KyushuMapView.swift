//
//  KyushuMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class KyushuMapView: DrawMapView {
    private var oitaColor = R.color.dangerColor7()!
    private var miyazakiColor = R.color.dangerColor7()!
    private var kagoshimaColor = R.color.dangerColor7()!
    private var kumamotoColor = R.color.dangerColor7()!
    private var sagaColor = R.color.dangerColor7()!
    private var fukuokaColor = R.color.dangerColor7()!
    private var nagasakiColor = R.color.dangerColor7()!
    private var okinawaColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 180
        originalHeight = 240
        super.draw(rect)

        oitaColor.setFill()
        Kyushu.oita.path.fill()
        drawPath(path: Kyushu.oita.path)

        miyazakiColor.setFill()
        Kyushu.miyazaki.path.fill()
        drawPath(path: Kyushu.miyazaki.path)

        kagoshimaColor.setFill()
        Kyushu.kagoshima.path.fill()
        drawPath(path: Kyushu.kagoshima.path)

        kumamotoColor.setFill()
        Kyushu.kumamoto.path.fill()
        drawPath(path: Kyushu.kumamoto.path)

        sagaColor.setFill()
        Kyushu.saga.path.fill()
        drawPath(path: Kyushu.saga.path)

        fukuokaColor.setFill()
        Kyushu.fukuoka.path.fill()
        drawPath(path: Kyushu.fukuoka.path)

        nagasakiColor.setFill()
        Kyushu.nagasaki.path.fill()
        drawPath(path: Kyushu.nagasaki.path)

        okinawaColor.setFill()
        Kyushu.okinawa.path.fill()
        drawPath(path: Kyushu.okinawa.path)

        context?.restoreGState()
    }
}
