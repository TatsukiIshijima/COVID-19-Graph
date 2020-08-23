//
//  APIClient.swift
//  Core
//

import Alamofire
import Foundation
import ReactiveSwift

public class APIClient {
    func request<Response>(_ urlConvertible: URLRequestConvertible) -> SignalProducer<Response, Error> where Response: APIResponse {
        return SignalProducer { observer, lifetime in
            if let url = urlConvertible.urlRequest?.url?.absoluteString {
                print("URL : \(url)")
            }
            let request = AF.request(urlConvertible).responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        // TODO: エラー送信
                        print("response data is nil")
                        return
                    }
                    do {
                        let responseData = try JSONDecoder().decode(Response.self, from: data)
                        observer.send(value: responseData)
                        observer.sendCompleted()
                    } catch {
                        observer.send(error: error)
                    }
                case let .failure(error):
                    observer.send(error: error)
                }
            }
            lifetime.observeEnded {
                request.cancel()
            }
        }
    }
}
