//
//  RegionViewController.swift
//  covid-19-graph
//

import Core
import Segmentio
import UIKit

final class RegionViewController: UIViewController {
    // 画面の横幅とTableViewの縦幅をイコールにすると高さ変更が効かなかったので
    // 一旦定数指定し、その後変更するようにする
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    // Storyboardでクラス指定しての描画でないとサイズが合わなかったので
    // 地方別にViewを描画し、表示/非表示を切り替える
    @IBOutlet private weak var hokkaidoMapView: HokkaidoMapView!
    @IBOutlet private weak var tohokuMapView: TohokuMapView!
    @IBOutlet private weak var kantoMapView: KantoMapView!
    @IBOutlet private weak var chubuMapView: ChubuMapView!
    @IBOutlet private weak var kinkiMapView: KinkiMapView!
    @IBOutlet private weak var chugokuMapView: ChugokuMapView!
    @IBOutlet private weak var shikokuMapView: ShikokuMapView!
    @IBOutlet private weak var kyushuMapView: KyushuMapView!
    @IBOutlet private weak var segmentio: Segmentio!

    private var regionDataViewController: RegionDataViewController?

    var region: RegionModel?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.string.localizable.regionTitle()

        // NavigationBarの下線を削除
        navigationController?.navigationBar.shadowImage = UIImage()

        setupSegmentio()

        guard let viewController = regionDataViewController,
            let region = self.region
            else {
                fatalError("RegionDataViewController or RegionModel is nil.")
        }
        // ヘッダーの高さ分で +1
        tableViewHeight.constant = CGFloat((region.prefectures.count + 1) * 44)
        viewController.reloadData(prefectures: Array(region.prefectures.values.sorted(by: { (first, second) -> Bool in
            first.id < second.id
        })))

        hokkaidoMapView.isHidden = true
        tohokuMapView.isHidden = true
        kantoMapView.isHidden = true
        chubuMapView.isHidden = true
        kinkiMapView.isHidden = true
        chugokuMapView.isHidden = true
        shikokuMapView.isHidden = true
        kyushuMapView.isHidden = true

        switch region.name {
        case .hokkaido:
            hokkaidoMapView.isHidden = false
            fillHokkaido(isHospitalize: true)
        case .tohoku:
            tohokuMapView.isHidden = false
            fillTohoku(isHospitalize: true)
        case .kanto:
            kantoMapView.isHidden = false
            fillKanto(isHospitalize: true)
        case .chubu:
            chubuMapView.isHidden = false
            fillChubu(isHospitalize: true)
        case .kinki:
            kinkiMapView.isHidden = false
            fillKinki(isHospitalize: true)
        case .chugoku:
            chugokuMapView.isHidden = false
            fillChugoku(isHospitalize: true)
        case .shikoku:
            shikokuMapView.isHidden = false
            fillShikoku(isHospitalize: true)
        case .kyusyu:
            kyushuMapView.isHidden = false
            fillKyushu(isHospitalize: true)
        }
    }
}

extension RegionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let regionDataViewController = segue.destination as? RegionDataViewController {
            self.regionDataViewController = regionDataViewController
        }
    }
}

extension RegionViewController {
    // Segmentio設定
    private func setupSegmentio() {
        let segmentioStates = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 14),
                titleTextColor: .white
            ),
            selectedState: SegmentioState(
                backgroundColor: R.color.secondaryColor()!,
                titleFont: UIFont.boldSystemFont(ofSize: 16),
                titleTextColor: .white
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor.white.withAlphaComponent(0.6),
                titleFont: UIFont.boldSystemFont(ofSize: 16),
                titleTextColor: .white
            )
        )
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom,
                                                         ratio: 1,
                                                         height: 5,
                                                         color: .orange)
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions(type: .none,
                                                                             height: 0,
                                                                             color: .clear)
        let segmentioOptions = SegmentioOptions(backgroundColor: R.color.primaryColor()!,
                                                segmentPosition: .dynamic,
                                                scrollEnabled: true,
                                                indicatorOptions: indicatorOptions,
                                                horizontalSeparatorOptions: horizontalSeparatorOptions,
                                                verticalSeparatorOptions: nil,
                                                imageContentMode: .center,
                                                labelTextAlignment: .center,
                                                labelTextNumberOfLines: 1,
                                                segmentStates: segmentioStates,
                                                animationDuration: 0.1)

        segmentio.setup(content: [SegmentioItem(title: R.string.localizable.currentTitle(), image: nil),
                                  SegmentioItem(title: R.string.localizable.totalTitle(), image: nil)],
                        style: .onlyLabel,
                        options: segmentioOptions)

        segmentio.selectedSegmentioIndex = 0

        segmentio.valueDidChange = { [weak self] _, _ in
            // TODO: 切り替え
        }
    }
}

extension RegionViewController {
    private func fillHokkaido(isHospitalize: Bool) {
        guard let region = self.region,
            let hokkaido = region.prefectures[.hokkaido]
            else {
                fatalError("Could not get Hokkaido Region.")
        }
        hokkaidoMapView.reDraw(hokkaidoColor: isHospitalize ? hokkaido.hospitalize.toLegendColor : hokkaido.cases.toLegendColor)
    }

    private func fillTohoku(isHospitalize: Bool) {
        guard let region = self.region,
            let aomori = region.prefectures[.aomori],
            let akita = region.prefectures[.akita],
            let iwate = region.prefectures[.iwate],
            let yamagata = region.prefectures[.yamagata],
            let miyagi = region.prefectures[.miyagi],
            let fukushima = region.prefectures[.fukushima]
            else {
                fatalError("Could not get Tohoku Regions.")
        }
        tohokuMapView.reDraw(aomoriColor: isHospitalize ? aomori.hospitalize.toLegendColor : aomori.cases.toLegendColor,
                             akitaColor: isHospitalize ? akita.hospitalize.toLegendColor : akita.cases.toLegendColor,
                             iwateColor: isHospitalize ? iwate.hospitalize.toLegendColor : iwate.cases.toLegendColor,
                             yamagataColor: isHospitalize ? yamagata.hospitalize.toLegendColor : yamagata.cases.toLegendColor,
                             miyagiColor: isHospitalize ? miyagi.hospitalize.toLegendColor : miyagi.cases.toLegendColor,
                             fukushimaColor: isHospitalize ? fukushima.hospitalize.toLegendColor : fukushima.cases.toLegendColor)
    }

    private func fillKanto(isHospitalize: Bool) {
        guard let region = self.region,
            let ibaraki = region.prefectures[.ibaraki],
            let chiba = region.prefectures[.chiba],
            let tochigi = region.prefectures[.tochigi],
            let gunma = region.prefectures[.gunma],
            let saitama = region.prefectures[.saitama],
            let tokyo = region.prefectures[.tokyo],
            let kanagawa = region.prefectures[.kanagawa]
            else {
                fatalError("Could not get Kanto Regions")
        }
        kantoMapView.reDraw(ibarakiColor: isHospitalize ? ibaraki.hospitalize.toLegendColor : ibaraki.cases.toLegendColor,
                            tochigiColor: isHospitalize ? tochigi.hospitalize.toLegendColor : tochigi.cases.toLegendColor,
                            gunmaColor: isHospitalize ? gunma.hospitalize.toLegendColor : gunma.cases.toLegendColor,
                            saitamaColor: isHospitalize ? saitama.hospitalize.toLegendColor : saitama.cases.toLegendColor,
                            chibaColor: isHospitalize ? chiba.hospitalize.toLegendColor : chiba.cases.toLegendColor,
                            tokyoColor: isHospitalize ? tokyo.hospitalize.toLegendColor : tokyo.cases.toLegendColor,
                            kanagawaColor: isHospitalize ? kanagawa.hospitalize.toLegendColor : kanagawa.cases.toLegendColor)
    }

    private func fillChubu(isHospitalize: Bool) {
        guard let region = self.region,
            let yamanashi = region.prefectures[.yamanashi],
            let nigata = region.prefectures[.nigata],
            let shizuoka = region.prefectures[.shizuoka],
            let nagano = region.prefectures[.nagano],
            let aichi = region.prefectures[.aichi],
            let gifu = region.prefectures[.gifu],
            let toyama = region.prefectures[.toyama],
            let ishikawa = region.prefectures[.ishikawa],
            let fukui = region.prefectures[.fukui]
            else {
                fatalError("Could not get Chubu Regions.")
        }
        chubuMapView.reDraw(yamanashiColor: isHospitalize ? yamanashi.hospitalize.toLegendColor : yamanashi.cases.toLegendColor,
                            nigataColor: isHospitalize ? nigata.hospitalize.toLegendColor : nigata.cases.toLegendColor,
                            shizuokaColor: isHospitalize ? shizuoka.hospitalize.toLegendColor : shizuoka.cases.toLegendColor,
                            naganoColor: isHospitalize ? nagano.hospitalize.toLegendColor : nagano.cases.toLegendColor,
                            aichiColor: isHospitalize ? aichi.hospitalize.toLegendColor : aichi.cases.toLegendColor,
                            gifuColor: isHospitalize ? gifu.hospitalize.toLegendColor : gifu.cases.toLegendColor,
                            toyamaColor: isHospitalize ? toyama.hospitalize.toLegendColor : toyama.cases.toLegendColor,
                            ishikawaColor: isHospitalize ? ishikawa.hospitalize.toLegendColor : ishikawa.cases.toLegendColor,
                            fukuiColor: isHospitalize ? fukui.hospitalize.toLegendColor : fukui.cases.toLegendColor)
    }

    private func fillKinki(isHospitalize: Bool) {
        guard let region = self.region,
            let mie = region.prefectures[.mie],
            let shiga = region.prefectures[.shiga],
            let nara = region.prefectures[.nara],
            let wakayama = region.prefectures[.wakayama],
            let osaka = region.prefectures[.osaka],
            let kyoto = region.prefectures[.kyoto],
            let hyogo = region.prefectures[.hyugo]
            else {
                fatalError("Could not get Kinki Regions.")
        }
        kinkiMapView.reDraw(mieColor: isHospitalize ? mie.hospitalize.toLegendColor : mie.cases.toLegendColor,
                            shigaColor: isHospitalize ? shiga.hospitalize.toLegendColor : shiga.cases.toLegendColor,
                            naraColor: isHospitalize ? nara.hospitalize.toLegendColor : nara.cases.toLegendColor,
                            wakayamaColor: isHospitalize ? wakayama.hospitalize.toLegendColor : wakayama.cases.toLegendColor,
                            osakaColor: isHospitalize ? osaka.hospitalize.toLegendColor : osaka.cases.toLegendColor,
                            kyotoColor: isHospitalize ? kyoto.hospitalize.toLegendColor : kyoto.cases.toLegendColor,
                            hyogoColor: isHospitalize ? hyogo.hospitalize.toLegendColor : hyogo.cases.toLegendColor)
    }

    private func fillChugoku(isHospitalize: Bool) {
        guard let region = self.region,
            let shimane = region.prefectures[.shimane],
            let tottori = region.prefectures[.tottori],
            let okayama = region.prefectures[.okayama],
            let hiroshima = region.prefectures[.hiroshima],
            let yamaguchi = region.prefectures[.yamaguchi]
            else {
                fatalError("Could not get Kinki Regions.")
        }
        chugokuMapView.reDraw(shimaneColor: isHospitalize ? shimane.hospitalize.toLegendColor : shimane.cases.toLegendColor,
                              tottoriColor: isHospitalize ? tottori.hospitalize.toLegendColor : tottori.cases.toLegendColor,
                              okayamaColor: isHospitalize ? okayama.hospitalize.toLegendColor : okayama.cases.toLegendColor,
                              hiroshimaColor: isHospitalize ? hiroshima.hospitalize.toLegendColor : hiroshima.cases.toLegendColor,
                              yamaguchiColor: isHospitalize ? yamaguchi.hospitalize.toLegendColor : yamaguchi.cases.toLegendColor)
    }

    private func fillShikoku(isHospitalize: Bool) {
        guard let region = self.region,
            let kagawa = region.prefectures[.kagawa],
            let tokushima = region.prefectures[.tokushima],
            let kochi = region.prefectures[.kouchi],
            let ehime = region.prefectures[.ehime]
            else {
                fatalError("Could not get Kinki Regions.")
        }
        shikokuMapView.reDraw(kagawaColor: isHospitalize ? kagawa.hospitalize.toLegendColor : kagawa.cases.toLegendColor,
                              tokushimaColor: isHospitalize ? tokushima.hospitalize.toLegendColor : tokushima.cases.toLegendColor,
                              kochiColor: isHospitalize ? kochi.hospitalize.toLegendColor : kochi.cases.toLegendColor,
                              ehimeColor: isHospitalize ? ehime.hospitalize.toLegendColor : ehime.cases.toLegendColor)
    }

    private func fillKyushu(isHospitalize: Bool) {
        guard let region = self.region,
            let oita = region.prefectures[.oita],
            let miyazaki = region.prefectures[.miyazaki],
            let kagoshima = region.prefectures[.kagoshima],
            let kumamoto = region.prefectures[.kumamoto],
            let fukuoka = region.prefectures[.fukuoka],
            let saga = region.prefectures[.saga],
            let nagasaki = region.prefectures[.nagasaki],
            let okinawa = region.prefectures[.okinawa]
            else {
                fatalError("Could not get Kinki Regions.")
        }
        kyushuMapView.reDraw(oitaColor: isHospitalize ? oita.hospitalize.toLegendColor : oita.cases.toLegendColor,
                             miyazakiColor: isHospitalize ? miyazaki.hospitalize.toLegendColor : miyazaki.cases.toLegendColor,
                             kagoshimaColor: isHospitalize ? kagoshima.hospitalize.toLegendColor : kagoshima.cases.toLegendColor,
                             kumamotoColor: isHospitalize ? kumamoto.hospitalize.toLegendColor : kumamoto.cases.toLegendColor,
                             sagaColor: isHospitalize ? saga.hospitalize.toLegendColor : saga.cases.toLegendColor,
                             fukuokaColor: isHospitalize ? fukuoka.hospitalize.toLegendColor : fukuoka.cases.toLegendColor,
                             nagasakiColor: isHospitalize ? nagasaki.hospitalize.toLegendColor : nagasaki.cases.toLegendColor,
                             okinawaColor: isHospitalize ? okinawa.hospitalize.toLegendColor : okinawa.cases.toLegendColor)
    }
}
