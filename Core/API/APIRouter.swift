//
//  APIRouter.swift
//  Core
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    case total(history: Bool = false, predict: Bool = false)
    case statistics
    case positives
    case prefectures

    private var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    private var headers: HTTPHeaders {
        var headers: [HTTPHeader] = []
        headers.append(HTTPHeader.contentType(APIConstants.ContentType.json.rawValue))
        return HTTPHeaders(headers)
    }

    private var path: String {
        switch self {
        case .total:
            return "total"
        case .statistics:
            return "statistics"
        case .positives:
            return "positives"
        case .prefectures:
            return "prefectures"
        }
    }

    private var parameters: Parameters? {
        switch self {
        case .total(history: true, predict: false):
            // Bool型の場合、0 or 1 に変換されるので、文字列型とする
            return [APIConstants.Parameters.history: "true"]
        case .total(history: false, predict: true):
            return [APIConstants.Parameters.predict: "true"]
        default:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        // URLの組み立て
        let url = try APIConstants.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(APIConstants.version).appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.headers = headers
        urlRequest.timeoutInterval = 5

        let encoding: ParameterEncoding = {
            switch method {
            default:
                return URLEncoding.default
            }
        }()

        return try encoding.encode(urlRequest, with: parameters)
    }
}
