//
//  PrefectureModel.swift
//  Core
//

public struct PrefectureModel {
    public enum Name: String {
        case hokkaido = "北海道"
        case aomori = "青森"
        case akita = "秋田"
        case iwate = "岩手"
        case yamagata = "山形"
        case miyagi = "宮城"
        case fukushima = "福島"
        case ibaraki = "茨城"
        case chiba = "千葉"
        case tochigi = "栃木"
        case gunma = "群馬"
        case saitama = "埼玉"
        case tokyo = "東京"
        case kanagawa = "神奈川"
        case yamanashi = "山梨"
        case nigata = "新潟"
        case shizuoka = "静岡"
        case nagano = "長野"
        case aichi = "愛知"
        case gifu = "岐阜"
        case toyama = "富山"
        case ishikawa = "石川"
        case fukui = "福井"
        case mie = "三重"
        case shiga = "滋賀"
        case nara = "奈良"
        case wakayama = "和歌山"
        case osaka = "大阪"
        case kyoto = "京都"
        case hyugo = "兵庫"
        case shimane = "島根"
        case tottori = "鳥取"
        case okayama = "岡山"
        case hiroshima = "広島"
        case yamaguchi = "山口"
        case kagawa = "香川"
        case tokushima = "徳島"
        case kouchi = "高知"
        case ehime = "愛媛"
        case oita = "大分"
        case miyazaki = "宮崎"
        case kagoshima = "鹿児島"
        case kumamoto = "熊本"
        case saga = "佐賀"
        case fukuoka = "福岡"
        case nagasaki = "長崎"
        case okinawa = "沖縄"
    }

    public let id: Int
    public let name: Name
    // 人口
    public let population: Int
    // 累計の感染者数
    public let cases: Int
    // 死亡者数
    public let deaths: Int
    // PCR検査人数
    public let pcr: Int
    // 現在の感染者数
    public let hospitalize: Int
    // 重傷者数
    public let severe: Int
    // 退院者数
    public let discharge: Int
    // 確認中
    public let symptomConfirming: Int
}
