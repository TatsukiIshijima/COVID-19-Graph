//
//  GenderResponse.swift
//  Core
//

import Foundation

public struct GenderResponse: APIResponse {
    public let count: Int
    public let generationsCount: GenerationsResponse
    
    enum CodingKeys: String, CodingKey {
        case count
        case generationsCount = "generations_count"
    }
}
