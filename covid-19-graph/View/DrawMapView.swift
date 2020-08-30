//
//  DrawMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

@IBDesignable class DrawMapView: UIView {
    var originalWidth: CGFloat = 0
    var originalHeight: CGFloat = 0
    var context: CGContext?
    private let defaultStrokeColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    private let defaultFillColor: UIColor = R.color.dangerColor7()!
    private let defaultLineWidth: CGFloat = 0.5
    private let defaultMiterLimit: CGFloat = 4

    override func draw(_ rect: CGRect) {
        context = UIGraphicsGetCurrentContext()
        guard let currentContext = context else {
            fatalError("Could not get context.")
        }
        currentContext.saveGState()

        let resizingBehavior: ResizingBehavior = .aspectFit
        let resizingFrame: CGRect = resizingBehavior.apply(rect: CGRect(x: 0, y: 0, width: originalWidth, height: originalHeight), target: rect)
        currentContext.translateBy(x: resizingFrame.minX, y: resizingFrame.minY)
        currentContext.scaleBy(x: resizingFrame.width / originalWidth, y: resizingFrame.height / originalHeight)

        defaultStrokeColor.setStroke()
        defaultFillColor.setFill()
    }

    func drawPath(path: UIBezierPath) {
        path.lineWidth = defaultLineWidth
        path.miterLimit = defaultLineWidth
        path.stroke()
        // path.fill()
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
