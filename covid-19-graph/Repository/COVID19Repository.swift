//
//  COVID19Repository.swift
//  covid-19-graph
//

import Alamofire
import Foundation
import ReactiveSwift

final class COVID19Repository {
    var client: COVID19Client

    init(client: COVID19Client) {
        self.client = client
    }

    func fetchTotal() -> SignalProducer<TotalResponse, Error> {
        return client.requestTotal()
    }
}
