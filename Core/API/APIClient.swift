//
//  APIClient.swift
//  covid-19-graph
//

import Alamofire
import Foundation
import ReactiveSwift

public class APIClient {
    func getRequest<Response>(baseUrl: String,
                              parameters: [String: Any]?,
                              headers: HTTPHeaders = ["Content-Type": "application/json"]) -> SignalProducer<Response, Error> where Response: APIResponse {
        return SignalProducer { observer, lifetime in
            let task = AF.request(baseUrl,
                                  method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding(destination: .queryString),
                                  headers: headers).responseJSON { response in
                                    switch response.result {
                                    case .success:
                                        guard let data = response.data else {
                                            return
                                        }
                                        do {
                                            let responseModel = try JSONDecoder().decode(Response.self, from: data)
                                            observer.send(value: responseModel)
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

    func post() {}
}
