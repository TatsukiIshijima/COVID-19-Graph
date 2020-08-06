//
//  PredictionResponse.swift
//  Core
//

import Foundation

public struct PredictionResponse: APIResponse {
    public let date: Int
    public let positive: Double
    public let death: Double
}
