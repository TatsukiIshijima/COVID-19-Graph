//
//  COVID19Repository.swift
//  covid-19-graph
//

import Alamofire
import Foundation
import ReactiveSwift

public final class COVID19Repository {
    var client: COVID19Client

    init(client: COVID19Client) {
        self.client = client
    }

    public func fetchTotal() -> SignalProducer<TotalResponse, Error> {
        return client.requestTotal()
    }
}
