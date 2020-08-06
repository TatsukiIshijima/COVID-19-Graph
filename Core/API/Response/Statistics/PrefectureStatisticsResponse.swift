//
//  PrefectureStatisticsResponse.swift
//  Core
//

import Foundation

public struct PrefectureStatisticsResponse {
    public let all: [StatisticsResponse]
    
    init(all: [StatisticsResponse]) {
        self.all = all
    }
}

extension PrefectureStatisticsResponse: APIResponse {
    public init(from decoder: Decoder) throws {
        var all: [StatisticsResponse] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let statistics = try unkeyedContainer.decode(StatisticsResponse.self)
            all.append(statistics)
        }
        self.init(all: all)
    }
}
