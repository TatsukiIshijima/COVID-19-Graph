//
//  APIRequest.swift
//  Core
//

import Foundation

// 参考:https://qiita.com/matsuda/items/ee6d02570f716da765e9
protocol APIRequest: Encodable {
    func encode(to encoder: Encoder) throws
}
