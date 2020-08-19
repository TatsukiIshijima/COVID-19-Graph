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

extension PrefectureListResponse {
    public func toJapanMapModel() -> JapanMapModel {
        var hokkaidoRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var tohokuRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var kantoRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var tyubuRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var kinkiRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var tyugokuRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var shikokuRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        var kyusyuRegion: [PrefectureModel.Name: PrefectureModel] = [:]
        
        list.forEach { response in
            let prefectureName = PrefectureModel.Name(rawValue: response.nameJa)
            guard let name = prefectureName else {
                print("\(response.nameJa) is not found.")
                return
            }
            
            let prefecture = PrefectureModel(id: response.id,
                                             name: name,
                                             population: response.population,
                                             cases: response.cases,
                                             deaths: response.deaths,
                                             pcr: response.pcr,
                                             hospitalize: response.hospitalize,
                                             severe: response.severe,
                                             discharge: response.discharge,
                                             symptomConfirming: response.symptomConfirming)
            
            if prefecture.name == .hokkaido {
                hokkaidoRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .aomori ||
                prefecture.name == .akita ||
                prefecture.name == .iwate ||
                prefecture.name == .yamagata ||
                prefecture.name == .miyagi ||
                prefecture.name == .fukushima
            {
                tohokuRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .ibaraki ||
                prefecture.name == .chiba ||
                prefecture.name == .tochigi ||
                prefecture.name == .gunma ||
                prefecture.name == .saitama ||
                prefecture.name == .tokyo ||
                prefecture.name == .kanagawa
            {
                kantoRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .yamanashi ||
                prefecture.name == .nigata ||
                prefecture.name == .shizuoka ||
                prefecture.name == .nagano ||
                prefecture.name == .aichi ||
                prefecture.name == .gifu ||
                prefecture.name == .toyama ||
                prefecture.name == .ishikawa ||
                prefecture.name == .fukui
            {
                tyubuRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .mie ||
                prefecture.name == .shiga ||
                prefecture.name == .nara ||
                prefecture.name == .wakayama ||
                prefecture.name == .osaka ||
                prefecture.name == .kyoto ||
                prefecture.name == .hyugo
            {
                kinkiRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .shimane ||
                prefecture.name == .tottori ||
                prefecture.name == .okayama ||
                prefecture.name == .hiroshima ||
                prefecture.name == .yamaguchi
            {
                tyugokuRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .kagawa ||
                prefecture.name == .tokushima ||
                prefecture.name == .kouchi ||
                prefecture.name == .ehime
            {
                shikokuRegion.updateValue(prefecture, forKey: prefecture.name)
            } else if prefecture.name == .oita ||
                prefecture.name == .miyazaki ||
                prefecture.name == .kagoshima ||
                prefecture.name == .kumamoto ||
                prefecture.name == .saga ||
                prefecture.name == .fukuoka ||
                prefecture.name == .nagasaki ||
                prefecture.name == .okinawa
            {
                kyusyuRegion.updateValue(prefecture, forKey: prefecture.name)
            }
        }
        return JapanMapModel(hokkaido: RegionModel(prefectures: hokkaidoRegion),
                             tohoku: RegionModel(prefectures: tohokuRegion),
                             kanto: RegionModel(prefectures: kantoRegion),
                             tyubu: RegionModel(prefectures: tyubuRegion),
                             kinki: RegionModel(prefectures: kinkiRegion),
                             tyugoku: RegionModel(prefectures: tyugokuRegion),
                             shikoku: RegionModel(prefectures: shikokuRegion),
                             kyusyu: RegionModel(prefectures: kyusyuRegion))
    }
}
