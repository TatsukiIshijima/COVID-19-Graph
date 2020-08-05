//
//  TotalResponse.swift
//  covid-19-graph
//

import Foundation

struct TotalResponse: APIResponse {
    // 日付
    var date: Int
    // PCR検査実施人数
    var pcr: Int
    // 入院者数
    var hospitalize: Int
    // 陽性者数
    var positive: Int
    // 重症者数
    var severe: Int
    // 退院者数
    var discharge: Int
    // 死亡者数
    var death: Int
    // 確認中
    var symptom_confirming: Int
}
