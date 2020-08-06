//
//  GenerationsResponse.swift
//  Core
//

import Foundation

public struct GenerationsResponse: APIResponse {
    public let generation00s: Int
    public let generation10s: Int
    public let generation20s: Int
    public let generation30s: Int
    public let generation40s: Int
    public let generation50s: Int
    public let generation60s: Int
    public let generation70s: Int
    public let generation80s: Int
    public let generation90s: Int
    public let generation100s: Int
    public let unknown: Int
    
    enum CodingKeys: String, CodingKey {
        case generation00s = "00s"
        case generation10s = "10s"
        case generation20s = "20s"
        case generation30s = "30s"
        case generation40s = "40s"
        case generation50s = "50s"
        case generation60s = "60s"
        case generation70s = "70s"
        case generation80s = "80s"
        case generation90s = "90s"
        case generation100s = "100s"
        case unknown
    }
}
