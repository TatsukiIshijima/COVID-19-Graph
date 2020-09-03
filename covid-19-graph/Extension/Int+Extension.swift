//
//  Int+Extension.swift
//  covid-19-graph
//

import Foundation
import UIKit

extension Int {
    var toCommaSeperateString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(for: self) ?? ""
    }

    var toLegendColor: UIColor {
        if self > 1000 {
            return R.color.dangerColor1()!
        } else if self > 500, self <= 1000 {
            return R.color.dangerColor2()!
        } else if self > 100, self <= 500 {
            return R.color.dangerColor3()!
        } else if self > 50, self <= 100 {
            return R.color.dangerColor4()!
        } else if self > 10, self <= 50 {
            return R.color.dangerColor5()!
        } else if self > 0, self <= 10 {
            return R.color.dangerColor6()!
        }
        return R.color.dangerColor7()!
    }
}
