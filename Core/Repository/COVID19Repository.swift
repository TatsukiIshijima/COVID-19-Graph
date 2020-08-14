//
//  COVID19Repository.swift
//  Core
//

import Alamofire
import Foundation
import ReactiveSwift

public class COVID19Repository {
    private let client: COVID19Client

    public init(client: COVID19Client) {
        self.client = client
    }

    public func fetchTotal() -> SignalProducer<TotalResponse, Error> {
        return client.requestTotal()
    }

    public func fetchTotalHistory() -> SignalProducer<TotalHistoryResponse, Error> {
        return client.requestTotalHistory()
    }

    public func fetchTotalPrediction() -> SignalProducer<TotalPredictionResponse, Error> {
        return client.requestTotalPrediction()
    }

    public func fetchStatistics() -> SignalProducer<PrefectureStatisticsResponse, Error> {
        return client.requestStatistics()
    }
}
