//
//  Int+Extension.swift
//  covid-19-graph
//

import Foundation

extension Int {
    var toCommaSeperateString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(for: self) ?? ""
    }
}
