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
        return SignalProducer { [weak self] observer, lifetime in
            guard let self = self else {
                observer.sendInterrupted()
                return
            }
            let task = self.client.requestTotal().responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }
                    do {
                        let total = try JSONDecoder().decode(TotalResponse.self, from: data)
                        observer.send(value: total)
                        observer.sendCompleted()
                    } catch {
                        observer.send(error: error)
                    }
                case let .failure(error):
                    observer.send(error: error)
                }
            }

            lifetime.observeEnded {
                task.cancel()
            }
        }
    }
}
