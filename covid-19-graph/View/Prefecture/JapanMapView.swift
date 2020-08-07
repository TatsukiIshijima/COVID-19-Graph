//
//  JapanMapView.swift
//  covid-19-graph
//

import Foundation
import UIKit

@IBDesignable class JapanMapView: UIView {
    override func draw(_ rect: CGRect) {
        JapanMap.drawCanvas1(frame: rect, resizing: .aspectFit)
    }
}
