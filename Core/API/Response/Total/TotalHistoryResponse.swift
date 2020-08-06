//
//  TotalHistoryResponse.swift
//  Core
//

import Foundation

public struct TotalHistoryResponse {
    public let history: [TotalResponse]
    
    init(history: [TotalResponse]) {
        self.history = history
    }
}

extension TotalHistoryResponse: APIResponse {
    public init(from decoder: Decoder) throws {
        var history: [TotalResponse] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let total = try unkeyedContainer.decode(TotalResponse.self)
            history.append(total)
        }
        self.init(history: history)
    }
}
