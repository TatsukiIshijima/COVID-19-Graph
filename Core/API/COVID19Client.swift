//
//  COVID19Client.swift
//  Core
//

import Alamofire
import Foundation
import ReactiveSwift

public final class COVID19Client: APIClient {
    private let baseUrl = "https://covid19-japan-web-api.now.sh/api"
    private let apiVersion = "v1"
    private let totalUrl: String
    // private let positiveUrl: String
    private let statistics: String

    override public init() {
        totalUrl = "\(baseUrl)/\(apiVersion)/total"
        // positiveUrl = "\(baseUrl)/\(apiVersion)/positives"
        statistics = "\(baseUrl)/\(apiVersion)/statistics"
    }

    public func requestTotal() -> SignalProducer<TotalResponse, Error> {
        return getRequest(baseUrl: totalUrl, parameters: nil)
    }

    public func requestTotalHistory() -> SignalProducer<TotalHistoryResponse, Error> {
        let url = "\(totalUrl)?history=true"
        return getRequest(baseUrl: url, parameters: nil)
    }

    public func requestTotalPrediction() -> SignalProducer<TotalPredictionResponse, Error> {
        let url = "\(totalUrl)?predict=true"
        return getRequest(baseUrl: url, parameters: nil)
    }
}
