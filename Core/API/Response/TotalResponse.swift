//
//  TotalResponse.swift
//  Core
//

import Foundation

public struct TotalResponse: APIResponse {
    // 日付
    public let date: Int
    // PCR検査実施人数
    public let pcr: Int
    // 入院者数
    public let hospitalize: Int
    // 陽性者数
    public let positive: Int
    // 重症者数
    public let severe: Int
    // 退院者数
    public let discharge: Int
    // 死亡者数
    public let death: Int
    // 確認中
    public let symptom_confirming: Int
}
