//
//  APIResponse.swift
//  Core
//

import Foundation

// 参考:https://qiita.com/matsuda/items/ee6d02570f716da765e9
protocol APIResponse: Decodable {
    init(from decoder: Decoder) throws
}
