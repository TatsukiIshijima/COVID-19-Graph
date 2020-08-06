//
//  TotalPrediction.swift
//  Core
//

import Foundation

public struct TotalPredictionResponse {
    public let total: [PredictionResponse]
    
    init(total: [PredictionResponse]) {
        self.total = total
    }
}

extension TotalPredictionResponse: APIResponse {
    public init(from decoder: Decoder) throws {
        var total: [PredictionResponse] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let prediction = try unkeyedContainer.decode(PredictionResponse.self)
            total.append(prediction)
        }
        self.init(total: total)
    }
}
