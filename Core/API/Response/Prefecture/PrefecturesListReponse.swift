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
        var hokkaidoRegion: [PrefectureModel] = []
        var tohokuRegion: [PrefectureModel] = []
        var kantoRegion: [PrefectureModel] = []
        var tyubuRegion: [PrefectureModel] = []
        var kinkiRegion: [PrefectureModel] = []
        var tyugokuRegion: [PrefectureModel] = []
        var shikokuRegion: [PrefectureModel] = []
        var kyusyuRegion: [PrefectureModel] = []
        
        list.forEach { response in
            let prefectureName = PrefectureModel.PrefectureName(rawValue: response.nameJa)
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
                hokkaidoRegion.append(prefecture)
            } else if prefecture.name == .aomori ||
                prefecture.name == .akita ||
                prefecture.name == .iwate ||
                prefecture.name == .yamagata ||
                prefecture.name == .miyagi ||
                prefecture.name == .fukushima
            {
                tohokuRegion.append(prefecture)
            } else if prefecture.name == .ibaraki ||
                prefecture.name == .chiba ||
                prefecture.name == .tochigi ||
                prefecture.name == .gunma ||
                prefecture.name == .saitama ||
                prefecture.name == .tokyo ||
                prefecture.name == .kanagawa
            {
                kantoRegion.append(prefecture)
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
                tyubuRegion.append(prefecture)
            } else if prefecture.name == .mie ||
                prefecture.name == .shiga ||
                prefecture.name == .nara ||
                prefecture.name == .wakayama ||
                prefecture.name == .osaka ||
                prefecture.name == .kyoto ||
                prefecture.name == .hyugo
            {
                kinkiRegion.append(prefecture)
            } else if prefecture.name == .shimane ||
                prefecture.name == .tottori ||
                prefecture.name == .okayama ||
                prefecture.name == .hiroshima ||
                prefecture.name == .yamaguchi
            {
                tyugokuRegion.append(prefecture)
            } else if prefecture.name == .kagawa ||
                prefecture.name == .tokushima ||
                prefecture.name == .kouchi ||
                prefecture.name == .ehime
            {
                shikokuRegion.append(prefecture)
            } else if prefecture.name == .oita ||
                prefecture.name == .miyazaki ||
                prefecture.name == .kagoshima ||
                prefecture.name == .kumamoto ||
                prefecture.name == .saga ||
                prefecture.name == .fukuoka ||
                prefecture.name == .nagasaki ||
                prefecture.name == .okinawa
            {
                kyusyuRegion.append(prefecture)
            }
        }
        return JapanMapModel(hokkaido: RegionModel(prefectures: [.hokkaido: hokkaidoRegion]),
                             tohoku: RegionModel(prefectures: [.tohoku: tohokuRegion]),
                             kanto: RegionModel(prefectures: [.kanto: kantoRegion]),
                             tyubu: RegionModel(prefectures: [.tyubu: tyubuRegion]),
                             kinki: RegionModel(prefectures: [.kinki: kinkiRegion]),
                             tyugoku: RegionModel(prefectures: [.tyugoku: tyugokuRegion]),
                             shikoku: RegionModel(prefectures: [.shikoku: shikokuRegion]),
                             kyusyu: RegionModel(prefectures: [.kyushu: kyusyuRegion]))
    }
}
