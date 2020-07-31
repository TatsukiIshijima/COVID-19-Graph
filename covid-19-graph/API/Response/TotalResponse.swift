//
//  TotalResponse.swift
//  covid-19-graph
//

import Foundation

struct TotalResponse: APIResponse {
    var date: Int
    var pcr: Int
    var hospitalize: Int
    var positive: Int
    var severe: Int
    var discharge: Int
    var death: Int
    var symptom_confirming: Int
}
