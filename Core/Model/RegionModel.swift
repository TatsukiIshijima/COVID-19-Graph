//
//  RegionModel.swift
//  Core
//

public struct RegionModel {
    public let name: Name
    public let prefectures: [PrefectureModel.Name: PrefectureModel]

    public enum Name: String {
        case hokkaido = "北海道"
        case tohoku = "東北"
        case kanto = "関東"
        case chubu = "中部"
        case kinki = "近畿"
        case chugoku = "中国"
        case shikoku = "四国"
        case kyusyu = "九州"
    }
}
