//
//  COVID19Repository.swift
//  Core
//

import Alamofire
import Foundation
import ReactiveSwift

public final class COVID19Repository {
    var client: COVID19Client

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
}
