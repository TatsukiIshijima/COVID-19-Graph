//
//  COVID19Client.swift
//  covid-19-graph
//

import Alamofire
import Foundation

final class COVID19Client: APIClient {
    func requestTotal() -> DataRequest {
        let url = "https://covid19-japan-web-api.now.sh/api/v1/total"
        return createGetRequest(baseUrl: url, parameters: nil)
    }
}
