//
//  HokkaidoMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class HokkaidoMapView: DrawMapView {
    private var hokkaidoColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 230
        originalHeight = 210
        super.draw(rect)

        hokkaidoColor.setFill()
        Hokkaido.hokkaido.path.fill()
        drawPath(path: Hokkaido.hokkaido.path)

        context?.restoreGState()
    }

    func reDraw(hokkaidoColor: UIColor = R.color.dangerColor7()!) {
        self.hokkaidoColor = hokkaidoColor
        setNeedsDisplay()
    }
}
