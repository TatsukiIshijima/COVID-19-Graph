//
//  APIClient.swift
//  covid-19-graph
//

import Alamofire
import Foundation

class APIClient {
    func createGetRequest(baseUrl: String,
                          parameters: [String: Any]?,
                          headers: HTTPHeaders = ["Content-Type": "application/json"]) -> DataRequest {
        return AF.request(baseUrl,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding(destination: .queryString),
                          headers: headers)
    }

    func post() {}
}
