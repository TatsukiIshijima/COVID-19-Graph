//
//  JapanMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

@IBDesignable class JapanMapView: UIView {
    let originalWidth: CGFloat = 560
    let originalHeight: CGFloat = 700
    let defaultStrokeColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let defaultFillColor = UIColor.lightGray
    let defaultLineWidth: CGFloat = 0.5
    let defaultMiterLimit: CGFloat = 4

    var isFill: Bool = false

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        guard let currentContext = context else {
            return
        }
        currentContext.saveGState()

        let resizingBehavior: ResizingBehavior = .aspectFit
        let resizingFrame: CGRect = resizingBehavior.apply(rect: CGRect(x: 0, y: 0, width: originalWidth, height: originalHeight), target: rect)
        currentContext.translateBy(x: resizingFrame.minX, y: resizingFrame.minY)
        currentContext.scaleBy(x: resizingFrame.width / originalWidth, y: resizingFrame.height / originalHeight)

        defaultStrokeColor.setStroke()
        defaultFillColor.setFill()

        // 北海道地方
        drawPrefecturePath(prefecture: Prefecture.hokkaido)
        // 東北地方
        drawPrefecturePath(prefecture: Prefecture.aomori)
        drawPrefecturePath(prefecture: Prefecture.akita)
        drawPrefecturePath(prefecture: Prefecture.iwate)
        drawPrefecturePath(prefecture: Prefecture.yamagata)
        drawPrefecturePath(prefecture: Prefecture.miyagi)
        drawPrefecturePath(prefecture: Prefecture.fukushima)
        // 関東地方
        drawPrefecturePath(prefecture: Prefecture.ibaraki)
        drawPrefecturePath(prefecture: Prefecture.chiba)
        drawPrefecturePath(prefecture: Prefecture.tochigi)
        drawPrefecturePath(prefecture: Prefecture.gunma)
        drawPrefecturePath(prefecture: Prefecture.saitama)
        drawPrefecturePath(prefecture: Prefecture.ogasawara)
        drawPrefecturePath(prefecture: Prefecture.tokyo)
        drawPrefecturePath(prefecture: Prefecture.kanagawa)
        // 中部地方
        drawPrefecturePath(prefecture: Prefecture.yamanashi)
        drawPrefecturePath(prefecture: Prefecture.niigata)
        drawPrefecturePath(prefecture: Prefecture.shizuoka)
        drawPrefecturePath(prefecture: Prefecture.nagano)
        drawPrefecturePath(prefecture: Prefecture.aichi)
        drawPrefecturePath(prefecture: Prefecture.gufu)
        drawPrefecturePath(prefecture: Prefecture.toyama)
        drawPrefecturePath(prefecture: Prefecture.ishikawa)
        drawPrefecturePath(prefecture: Prefecture.fukui)
        // 近畿地方
        drawPrefecturePath(prefecture: Prefecture.mie)
        drawPrefecturePath(prefecture: Prefecture.shiga)
        drawPrefecturePath(prefecture: Prefecture.nara)
        drawPrefecturePath(prefecture: Prefecture.wakayama)
        drawPrefecturePath(prefecture: Prefecture.osaka)
        drawPrefecturePath(prefecture: Prefecture.kyoto)
        drawPrefecturePath(prefecture: Prefecture.hyogo)
        // 中国地方
        drawPrefecturePath(prefecture: Prefecture.shimane)
        drawPrefecturePath(prefecture: Prefecture.tottori)
        drawPrefecturePath(prefecture: Prefecture.okayama)
        drawPrefecturePath(prefecture: Prefecture.hiroshima)
        drawPrefecturePath(prefecture: Prefecture.yamaguchi)
        // 四国地方
        drawPrefecturePath(prefecture: Prefecture.kagawa)
        drawPrefecturePath(prefecture: Prefecture.tokushima)
        drawPrefecturePath(prefecture: Prefecture.kochi)
        drawPrefecturePath(prefecture: Prefecture.ehime)
        // 九州地方
        drawPrefecturePath(prefecture: Prefecture.oita)
        drawPrefecturePath(prefecture: Prefecture.miyazaki)
        drawPrefecturePath(prefecture: Prefecture.kagoshima)
        drawPrefecturePath(prefecture: Prefecture.kumamoto)
        drawPrefecturePath(prefecture: Prefecture.saga)
        drawPrefecturePath(prefecture: Prefecture.fukuoka)
        drawPrefecturePath(prefecture: Prefecture.nagasaki)
        drawPrefecturePath(prefecture: Prefecture.okinawa)

        if isFill {
            UIColor.blue.setFill()
            Prefecture.hokkaido.path.fill()
        }

        currentContext.restoreGState()
    }

    private func drawPrefecturePath(prefecture: Prefecture) {
        prefecture.path.lineWidth = defaultLineWidth
        prefecture.path.miterLimit = defaultMiterLimit
        prefecture.path.stroke()
        prefecture.path.fill()
    }

    func fillPrefecture() {
        print("fillPrefecture")
        isFill = true
        // 以下で再度drawを呼び出す
        setNeedsDisplay()
    }

    enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
            case .aspectFit:
                scales.width = min(scales.width, scales.height)
                scales.height = scales.width
            case .aspectFill:
                scales.width = max(scales.width, scales.height)
                scales.height = scales.width
            case .stretch:
                break
            case .center:
                scales.width = 1
                scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
