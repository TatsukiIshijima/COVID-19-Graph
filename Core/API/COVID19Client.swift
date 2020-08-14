//
//  COVID19Client.swift
//  Core
//

import Alamofire
import Foundation
import ReactiveSwift

public final class COVID19Client: APIClient {
    override public init() {}

    public func requestTotal() -> SignalProducer<TotalResponse, Error> {
        return getRequest(APIRouter.total(history: false, predict: false))
    }

    public func requestTotalHistory() -> SignalProducer<TotalHistoryResponse, Error> {
        return getRequest(APIRouter.total(history: true, predict: false))
    }

    public func requestTotalPrediction() -> SignalProducer<TotalPredictionResponse, Error> {
        return getRequest(APIRouter.total(history: false, predict: true))
    }

    public func requestStatistics() -> SignalProducer<PrefectureStatisticsResponse, Error> {
        return getRequest(APIRouter.statistics)
    }
}
