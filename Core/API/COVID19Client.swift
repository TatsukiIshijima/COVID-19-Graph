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
        let url = "https://covid19-japan-web-api.now.sh/api/v1/total"
        return getRequest(baseUrl: url, parameters: nil)
    }
}
