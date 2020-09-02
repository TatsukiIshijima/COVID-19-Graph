//
//  KantoMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

final class KantoMapView: DrawMapView {
    private var ibarakiColor = R.color.dangerColor7()!
    private var tochigiColor = R.color.dangerColor7()!
    private var gunmaColor = R.color.dangerColor7()!
    private var saitamaColor = R.color.dangerColor7()!
    private var chibaColor = R.color.dangerColor7()!
    private var tokyoColor = R.color.dangerColor7()!
    private var kanagawaColor = R.color.dangerColor7()!

    override func draw(_ rect: CGRect) {
        originalWidth = 225
        originalHeight = 225
        super.draw(rect)

        context?.saveGState()
        context?.translateBy(x: -531.38, y: -554.69)
        context?.scaleBy(x: 2, y: 2)

        ibarakiColor.setFill()
        Kanto.ibaraki.path.fill()
        drawPath(path: Kanto.ibaraki.path)

        tochigiColor.setFill()
        Kanto.tochigi.path.fill()
        drawPath(path: Kanto.tochigi.path)

        gunmaColor.setFill()
        Kanto.gunma.path.fill()
        drawPath(path: Kanto.gunma.path)

        saitamaColor.setFill()
        Kanto.saitama.path.fill()
        drawPath(path: Kanto.saitama.path)

        chibaColor.setFill()
        Kanto.chiba.path.fill()
        drawPath(path: Kanto.chiba.path)

        tokyoColor.setFill()
        Kanto.tokyo.path.fill()
        drawPath(path: Kanto.tokyo.path)

        kanagawaColor.setFill()
        Kanto.kanagawa.path.fill()
        drawPath(path: Kanto.kanagawa.path)

        context?.restoreGState()
    }

    func reDraw(ibarakiColor: UIColor = R.color.dangerColor7()!,
                tochigiColor: UIColor = R.color.dangerColor7()!,
                gunmaColor: UIColor = R.color.dangerColor7()!,
                saitamaColor: UIColor = R.color.dangerColor7()!,
                chibaColor: UIColor = R.color.dangerColor7()!,
                tokyoColor: UIColor = R.color.dangerColor7()!,
                kanagawaColor: UIColor = R.color.dangerColor7()!) {
        self.ibarakiColor = ibarakiColor
        self.tochigiColor = tochigiColor
        self.gunmaColor = gunmaColor
        self.saitamaColor = saitamaColor
        self.chibaColor = chibaColor
        self.tokyoColor = tokyoColor
        self.kanagawaColor = kanagawaColor
        setNeedsDisplay()
    }
}
