//
//  StatisticsResponse.swift
//  Core
//

import Foundation

public struct StatisticsResponse: APIResponse {
    public let nameJa: String
    public let nameEn: String
    public let totalCount: Int
    public let male: GenderResponse
    public let female: GenderResponse
    public let unknownGender: GenderResponse
    
    enum CodingKeys: String, CodingKey {
        case nameJa = "name_ja"
        case nameEn = "name_en"
        case totalCount = "total_count"
        case male
        case female
        case unknownGender = "unkown_gender"
    }
}
