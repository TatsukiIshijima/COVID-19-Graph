//
//  PrefectureResponse.swift
//  Core
//

public struct PrefectureResponse: APIResponse {
    let id: String
    let nameJa: String
    let population: Int
    let cases: Int
    let deaths: Int
    let pcr: Int
    let hospitalize: Int
    let severe: Int
    let discharge: Int
    let symptomConfirming: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameJa = "name_ja"
        case population
        case cases
        case deaths
        case pcr
        case hospitalize
        case severe
        case discharge
        case symptomConfirming = "symptom_confirming"
    }
}
