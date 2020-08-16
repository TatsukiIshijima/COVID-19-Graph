//
//  TotalResponse.swift
//  Core
//

import Foundation

public struct TotalResponse: APIResponse {
    // 日付
    let date: Int
    // PCR検査実施人数
    let pcr: Int
    // 入院者数
    let hospitalize: Int
    // 陽性者数
    let positive: Int
    // 重症者数
    let severe: Int
    // 退院者数
    let discharge: Int
    // 死亡者数
    let death: Int
    // 確認中
    let symptom_confirming: Int
}
