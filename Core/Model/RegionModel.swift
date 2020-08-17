//
//  RegionModel.swift
//  Core
//

public struct RegionModel {
    enum RegionName: String {
        case hokkaido = "北海道"
        case tohoku = "東北"
        case kanto = "関東"
        case tyubu = "中部"
        case kinki = "近畿"
        case tyugoku = "中国"
        case shikoku = "四国"
        case kyushu = "九州"
    }

    let prefectures: [RegionName: [PrefectureModel]]
}
