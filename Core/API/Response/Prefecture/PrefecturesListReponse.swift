//
//  PrefecturesListReponse.swift
//  Core
//

public struct PrefectureListResponse {
    let list: [PrefectureResponse]
}

extension PrefectureListResponse: APIResponse {
    public init(from decoder: Decoder) throws {
        var list: [PrefectureResponse] = []
        var unkeyedContainer = try decoder.unkeyedContainer()
        while !unkeyedContainer.isAtEnd {
            let prefecture = try unkeyedContainer.decode(PrefectureResponse.self)
            list.append(prefecture)
        }
        self.init(list: list)
    }
}
