//
//  COVID19Client.swift
//  covid-19-graph
//

import Alamofire
import Foundation
import ReactiveSwift

public final class COVID19Client: APIClient {
    public func requestTotal() -> SignalProducer<TotalResponse, Error> {
        let url = "https://covid19-japan-web-api.now.sh/api/v1/total"
        return getRequest(baseUrl: url, parameters: nil)
    }
}
