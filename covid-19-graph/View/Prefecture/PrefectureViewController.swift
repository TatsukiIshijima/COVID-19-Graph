//
//  PrefectureViewController.swift
//  covid-19-graph
//

import Core
import Segmentio
import SVProgressHUD
import UIKit

class PrefectureViewController: ErrorViewController<PrefectureViewModel> {
    @IBOutlet private weak var segmentioView: Segmentio!
    @IBOutlet private weak var japanMapView: JapanMapView!

    private var japanMapModel: JapanMapModel?

    var coordinator: PrefectureCoordinator?

    override func viewDidLoad() {
        title = R.string.localizable.prefectureTitle()
        // NavigationBarの下線を削除
        navigationController?.navigationBar.shadowImage = UIImage()

        setupSegmentio()

        viewModel = AppDelegate.shared.appContainer.prefectureContainer?.build()

        retryAction = { [weak self] (_: UIAlertAction!) -> Void in
            self?.viewModel?.drawPrefectures()
        }

        guard let viewModel = viewModel else {
            fatalError("PrefectureViewModel is nil.")
        }

        // ErrorViewControllerのErrorProperty購読のためにはViewModelが
        // 生成されている必要があるので、ここでsuperを呼び出す
        super.viewDidLoad()

        viewModel.japanMapDataProperty.signal.observeValues { [weak self] japanMapModel in
            self?.japanMapModel = japanMapModel
            self?.drawJapanMap(isHospitalize: true)
        }

        viewModel.loadingProperty.signal.observeValues { isLoading in
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }

        japanMapView.isUserInteractionEnabled = true

        let selector = #selector(PrefectureViewController.tapAction(_:))
        japanMapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))

        viewModel.drawPrefectures()
    }

    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        let originalTapPoint = sender.location(in: japanMapView)
        // 以下は元画像のサイズ
        let imageWidth: CGFloat = japanMapView.originalWidth
        let imageHeight: CGFloat = japanMapView.originalHeight

        let imageTapPoint = CGPoint(x: imageWidth / japanMapView.frame.width * originalTapPoint.x, y: imageHeight / japanMapView.frame.height * originalTapPoint.y)

        var selectedResion: RegionModel?

        // FIXME: 北海道,四国,沖縄が反応しない
        if Prefecture.hokkaido.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.hokkaido
        } else if Prefecture.aomori.path.contains(imageTapPoint) ||
            Prefecture.akita.path.contains(imageTapPoint) ||
            Prefecture.iwate.path.contains(imageTapPoint) ||
            Prefecture.yamagata.path.contains(imageTapPoint) ||
            Prefecture.miyagi.path.contains(imageTapPoint) ||
            Prefecture.fukushima.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.tohoku
        } else if Prefecture.ibaraki.path.contains(imageTapPoint) ||
            Prefecture.chiba.path.contains(imageTapPoint) ||
            Prefecture.tochigi.path.contains(imageTapPoint) ||
            Prefecture.gunma.path.contains(imageTapPoint) ||
            Prefecture.saitama.path.contains(imageTapPoint) ||
            Prefecture.tokyo.path.contains(imageTapPoint) ||
            Prefecture.kanagawa.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.kanto
        } else if Prefecture.yamanashi.path.contains(imageTapPoint) ||
            Prefecture.niigata.path.contains(imageTapPoint) ||
            Prefecture.shizuoka.path.contains(imageTapPoint) ||
            Prefecture.nagano.path.contains(imageTapPoint) ||
            Prefecture.aichi.path.contains(imageTapPoint) ||
            Prefecture.gufu.path.contains(imageTapPoint) ||
            Prefecture.toyama.path.contains(imageTapPoint) ||
            Prefecture.ishikawa.path.contains(imageTapPoint) ||
            Prefecture.fukui.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.tyubu
        } else if Prefecture.mie.path.contains(imageTapPoint) ||
            Prefecture.shiga.path.contains(imageTapPoint) ||
            Prefecture.nara.path.contains(imageTapPoint) ||
            Prefecture.wakayama.path.contains(imageTapPoint) ||
            Prefecture.osaka.path.contains(imageTapPoint) ||
            Prefecture.kyoto.path.contains(imageTapPoint) ||
            Prefecture.hyogo.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.kinki
        } else if Prefecture.shimane.path.contains(imageTapPoint) ||
            Prefecture.tottori.path.contains(imageTapPoint) ||
            Prefecture.okayama.path.contains(imageTapPoint) ||
            Prefecture.hiroshima.path.contains(imageTapPoint) ||
            Prefecture.yamaguchi.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.tyugoku
        } else if Prefecture.kagawa.path.contains(imageTapPoint) ||
            Prefecture.tokushima.path.contains(imageTapPoint) ||
            Prefecture.kochi.path.contains(imageTapPoint) ||
            Prefecture.ehime.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.shikoku
        } else if Prefecture.oita.path.contains(imageTapPoint) ||
            Prefecture.miyazaki.path.contains(imageTapPoint) ||
            Prefecture.kagoshima.path.contains(imageTapPoint) ||
            Prefecture.kumamoto.path.contains(imageTapPoint) ||
            Prefecture.fukuoka.path.contains(imageTapPoint) ||
            Prefecture.saga.path.contains(imageTapPoint) ||
            Prefecture.nagasaki.path.contains(imageTapPoint) ||
            Prefecture.okinawa.path.contains(imageTapPoint) {
            selectedResion = japanMapModel?.kyusyu
        }

        if let region = selectedResion {
            coordinator?.goToRegion(region: region)
        }
    }
}

extension PrefectureViewController {
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

        segmentioView.setup(content: [SegmentioItem(title: R.string.localizable.currentTitle(), image: nil),
                                      SegmentioItem(title: R.string.localizable.totalTitle(), image: nil)],
                            style: .onlyLabel,
                            options: segmentioOptions)

        segmentioView.selectedSegmentioIndex = 0

        segmentioView.valueDidChange = { [weak self] _, index in
            self?.drawJapanMap(isHospitalize: index == 0)
        }
    }
}

extension PrefectureViewController {
    private func drawJapanMap(isHospitalize: Bool) {
        guard let hokkaido = japanMapModel?.hokkaido.prefectures[.hokkaido],
            let aomori = japanMapModel?.tohoku.prefectures[.aomori],
            let akita = japanMapModel?.tohoku.prefectures[.akita],
            let iwate = japanMapModel?.tohoku.prefectures[.iwate],
            let yamagata = japanMapModel?.tohoku.prefectures[.yamagata],
            let miyagi = japanMapModel?.tohoku.prefectures[.miyagi],
            let fukushima = japanMapModel?.tohoku.prefectures[.fukushima],
            let ibaraki = japanMapModel?.kanto.prefectures[.ibaraki],
            let chiba = japanMapModel?.kanto.prefectures[.chiba],
            let tochigi = japanMapModel?.kanto.prefectures[.tochigi],
            let gunma = japanMapModel?.kanto.prefectures[.gunma],
            let saitama = japanMapModel?.kanto.prefectures[.saitama],
            let tokyo = japanMapModel?.kanto.prefectures[.tokyo],
            let kanagawa = japanMapModel?.kanto.prefectures[.kanagawa],
            let yamanashi = japanMapModel?.tyubu.prefectures[.yamanashi],
            let nigata = japanMapModel?.tyubu.prefectures[.nigata],
            let shizuoka = japanMapModel?.tyubu.prefectures[.shizuoka],
            let nagano = japanMapModel?.tyubu.prefectures[.nagano],
            let aichi = japanMapModel?.tyubu.prefectures[.aichi],
            let gifu = japanMapModel?.tyubu.prefectures[.gifu],
            let toyama = japanMapModel?.tyubu.prefectures[.toyama],
            let ishikawa = japanMapModel?.tyubu.prefectures[.ishikawa],
            let fukui = japanMapModel?.tyubu.prefectures[.fukui],
            let mie = japanMapModel?.kinki.prefectures[.mie],
            let shiga = japanMapModel?.kinki.prefectures[.shiga],
            let nara = japanMapModel?.kinki.prefectures[.nara],
            let wakayama = japanMapModel?.kinki.prefectures[.wakayama],
            let osaka = japanMapModel?.kinki.prefectures[.osaka],
            let kyoto = japanMapModel?.kinki.prefectures[.kyoto],
            let hyogo = japanMapModel?.kinki.prefectures[.hyugo],
            let shimane = japanMapModel?.tyugoku.prefectures[.shimane],
            let tottori = japanMapModel?.tyugoku.prefectures[.tottori],
            let okayama = japanMapModel?.tyugoku.prefectures[.okayama],
            let hiroshima = japanMapModel?.tyugoku.prefectures[.hiroshima],
            let yamaguchi = japanMapModel?.tyugoku.prefectures[.yamaguchi],
            let kagawa = japanMapModel?.shikoku.prefectures[.kagawa],
            let tokushima = japanMapModel?.shikoku.prefectures[.tokushima],
            let kochi = japanMapModel?.shikoku.prefectures[.kouchi],
            let ehime = japanMapModel?.shikoku.prefectures[.ehime],
            let oita = japanMapModel?.kyusyu.prefectures[.oita],
            let miyazaki = japanMapModel?.kyusyu.prefectures[.miyazaki],
            let kagoshima = japanMapModel?.kyusyu.prefectures[.kagoshima],
            let kumamoto = japanMapModel?.kyusyu.prefectures[.kumamoto],
            let fukuoka = japanMapModel?.kyusyu.prefectures[.fukuoka],
            let saga = japanMapModel?.kyusyu.prefectures[.saga],
            let nagasaki = japanMapModel?.kyusyu.prefectures[.nagasaki],
            let okinawa = japanMapModel?.kyusyu.prefectures[.okinawa]
            else {
                return
        }

        // hospitalize が現在 cases が累計
        japanMapView.reDraw(hokkaidoColor: isHospitalize ? hokkaido.hospitalize.toLegendColor : hokkaido.cases.toLegendColor,
                            aomoriColor: isHospitalize ? aomori.hospitalize.toLegendColor : aomori.cases.toLegendColor,
                            akitaColor: isHospitalize ? akita.hospitalize.toLegendColor : akita.cases.toLegendColor,
                            iwateColor: isHospitalize ? iwate.hospitalize.toLegendColor : iwate.cases.toLegendColor,
                            yamagataColor: isHospitalize ? yamagata.hospitalize.toLegendColor : yamagata.cases.toLegendColor,
                            miyagiColor: isHospitalize ? miyagi.hospitalize.toLegendColor : miyagi.cases.toLegendColor,
                            fukushimaColor: isHospitalize ? fukushima.hospitalize.toLegendColor : fukushima.cases.toLegendColor,
                            ibarakiColor: isHospitalize ? ibaraki.hospitalize.toLegendColor : ibaraki.cases.toLegendColor,
                            chibaColor: isHospitalize ? chiba.hospitalize.toLegendColor : chiba.cases.toLegendColor,
                            tochigiColor: isHospitalize ? tochigi.hospitalize.toLegendColor : tochigi.cases.toLegendColor,
                            gunmaColor: isHospitalize ? gunma.hospitalize.toLegendColor : gunma.cases.toLegendColor,
                            saitamaColor: isHospitalize ? saitama.hospitalize.toLegendColor : saitama.cases.toLegendColor,
                            tokyoColor: isHospitalize ? tokyo.hospitalize.toLegendColor : tokyo.cases.toLegendColor,
                            kanagawaColor: isHospitalize ? kanagawa.hospitalize.toLegendColor : kanagawa.cases.toLegendColor,
                            yamanashiColor: isHospitalize ? yamanashi.hospitalize.toLegendColor : yamanashi.cases.toLegendColor,
                            nigataColor: isHospitalize ? nigata.hospitalize.toLegendColor : nigata.cases.toLegendColor,
                            shizuokaColor: isHospitalize ? shizuoka.hospitalize.toLegendColor : shizuoka.cases.toLegendColor,
                            naganoColor: isHospitalize ? nagano.hospitalize.toLegendColor : nagano.cases.toLegendColor,
                            aichiColor: isHospitalize ? aichi.hospitalize.toLegendColor : aichi.cases.toLegendColor,
                            gifuColor: isHospitalize ? gifu.hospitalize.toLegendColor : gifu.cases.toLegendColor,
                            toyamaColor: isHospitalize ? toyama.hospitalize.toLegendColor : toyama.cases.toLegendColor,
                            ishikawaColor: isHospitalize ? ishikawa.hospitalize.toLegendColor : ishikawa.cases.toLegendColor,
                            fukuiColor: isHospitalize ? fukui.hospitalize.toLegendColor : fukui.cases.toLegendColor,
                            mieColor: isHospitalize ? mie.hospitalize.toLegendColor : mie.cases.toLegendColor,
                            shigaColor: isHospitalize ? shiga.hospitalize.toLegendColor : shiga.cases.toLegendColor,
                            naraColor: isHospitalize ? nara.hospitalize.toLegendColor : nara.cases.toLegendColor,
                            wakayamaColor: isHospitalize ? wakayama.hospitalize.toLegendColor : wakayama.cases.toLegendColor,
                            osakaColor: isHospitalize ? osaka.hospitalize.toLegendColor : osaka.cases.toLegendColor,
                            kyotoColor: isHospitalize ? kyoto.hospitalize.toLegendColor : kyoto.cases.toLegendColor,
                            hyogoColor: isHospitalize ? hyogo.hospitalize.toLegendColor : hyogo.cases.toLegendColor,
                            shimaneColor: isHospitalize ? shimane.hospitalize.toLegendColor : shimane.cases.toLegendColor,
                            tottoriColor: isHospitalize ? tottori.hospitalize.toLegendColor : tottori.cases.toLegendColor,
                            okayamaColor: isHospitalize ? okayama.hospitalize.toLegendColor : okayama.cases.toLegendColor,
                            hiroshimaColor: isHospitalize ? hiroshima.hospitalize.toLegendColor : hiroshima.cases.toLegendColor,
                            yamaguchiColor: isHospitalize ? yamaguchi.hospitalize.toLegendColor : yamaguchi.cases.toLegendColor,
                            kagawaColor: isHospitalize ? kagawa.hospitalize.toLegendColor : kagawa.cases.toLegendColor,
                            tokushimaColor: isHospitalize ? tokushima.hospitalize.toLegendColor : tokushima.cases.toLegendColor,
                            kochiColor: isHospitalize ? kochi.hospitalize.toLegendColor : kochi.cases.toLegendColor,
                            ehimeColor: isHospitalize ? ehime.hospitalize.toLegendColor : ehime.cases.toLegendColor,
                            oitaColor: isHospitalize ? oita.hospitalize.toLegendColor : oita.cases.toLegendColor,
                            miyazakiColor: isHospitalize ? miyazaki.hospitalize.toLegendColor : miyazaki.cases.toLegendColor,
                            kagoshimaColor: isHospitalize ? kagoshima.hospitalize.toLegendColor : kagoshima.cases.toLegendColor,
                            kumamotoColor: isHospitalize ? kumamoto.hospitalize.toLegendColor : kumamoto.cases.toLegendColor,
                            fukuokaColor: isHospitalize ? fukuoka.hospitalize.toLegendColor : fukuoka.cases.toLegendColor,
                            sagaColor: isHospitalize ? saga.hospitalize.toLegendColor : saga.cases.toLegendColor,
                            nagasakiColor: isHospitalize ? nagasaki.hospitalize.toLegendColor : nagasaki.cases.toLegendColor,
                            okinawaColor: isHospitalize ? okinawa.hospitalize.toLegendColor : okinawa.cases.toLegendColor)
    }
}
