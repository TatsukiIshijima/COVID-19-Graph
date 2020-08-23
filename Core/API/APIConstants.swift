//
//  APIConstants.swift
//  Core
//

struct APIConstants {
    static let baseUrl = "https://covid19-japan-web-api.now.sh/api"
    static let version = "v1"

    struct Parameters {
        static let history = "history"
        static let predict = "predict"
    }

    enum ContentType: String {
        case json = "application/json"
    }
}
