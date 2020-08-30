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

        guard let viewModel = self.viewModel else {
            fatalError("Could not get PrefectureViewModel.")
        }

        // hospitalize が現在 cases が累計
        japanMapView.reDraw(hokkaidoColor: viewModel.toLegendColor(number: isHospitalize ? hokkaido.hospitalize : hokkaido.cases),
                            aomoriColor: viewModel.toLegendColor(number: isHospitalize ? aomori.hospitalize : aomori.cases),
                            akitaColor: viewModel.toLegendColor(number: isHospitalize ? akita.hospitalize : akita.cases),
                            iwateColor: viewModel.toLegendColor(number: isHospitalize ? iwate.hospitalize : iwate.cases),
                            yamagataColor: viewModel.toLegendColor(number: isHospitalize ? yamagata.hospitalize : yamagata.cases),
                            miyagiColor: viewModel.toLegendColor(number: isHospitalize ? miyagi.hospitalize : miyagi.cases),
                            fukushimaColor: viewModel.toLegendColor(number: isHospitalize ? fukushima.hospitalize : fukushima.cases),
                            ibarakiColor: viewModel.toLegendColor(number: isHospitalize ? ibaraki.hospitalize : ibaraki.cases),
                            chibaColor: viewModel.toLegendColor(number: isHospitalize ? chiba.hospitalize : chiba.cases),
                            tochigiColor: viewModel.toLegendColor(number: isHospitalize ? tochigi.hospitalize : tochigi.cases),
                            gunmaColor: viewModel.toLegendColor(number: isHospitalize ? gunma.hospitalize : gunma.cases),
                            saitamaColor: viewModel.toLegendColor(number: isHospitalize ? saitama.hospitalize : saitama.cases),
                            tokyoColor: viewModel.toLegendColor(number: isHospitalize ? tokyo.hospitalize : tokyo.cases),
                            kanagawaColor: viewModel.toLegendColor(number: isHospitalize ? kanagawa.hospitalize : kanagawa.cases),
                            yamanashiColor: viewModel.toLegendColor(number: isHospitalize ? yamanashi.hospitalize : yamanashi.cases),
                            nigataColor: viewModel.toLegendColor(number: isHospitalize ? nigata.hospitalize : nigata.cases),
                            shizuokaColor: viewModel.toLegendColor(number: isHospitalize ? shizuoka.hospitalize : shizuoka.cases),
                            naganoColor: viewModel.toLegendColor(number: isHospitalize ? nagano.hospitalize : nagano.cases),
                            aichiColor: viewModel.toLegendColor(number: isHospitalize ? aichi.hospitalize : aichi.cases),
                            gifuColor: viewModel.toLegendColor(number: isHospitalize ? gifu.hospitalize : gifu.cases),
                            toyamaColor: viewModel.toLegendColor(number: isHospitalize ? toyama.hospitalize : toyama.cases),
                            ishikawaColor: viewModel.toLegendColor(number: isHospitalize ? ishikawa.hospitalize : ishikawa.cases),
                            fukuiColor: viewModel.toLegendColor(number: isHospitalize ? fukui.hospitalize : fukui.cases),
                            mieColor: viewModel.toLegendColor(number: isHospitalize ? mie.hospitalize : mie.cases),
                            shigaColor: viewModel.toLegendColor(number: isHospitalize ? shiga.hospitalize : shiga.cases),
                            naraColor: viewModel.toLegendColor(number: isHospitalize ? nara.hospitalize : nara.cases),
                            wakayamaColor: viewModel.toLegendColor(number: isHospitalize ? wakayama.hospitalize : wakayama.cases),
                            osakaColor: viewModel.toLegendColor(number: isHospitalize ? osaka.hospitalize : osaka.cases),
                            kyotoColor: viewModel.toLegendColor(number: isHospitalize ? kyoto.hospitalize : kyoto.cases),
                            hyogoColor: viewModel.toLegendColor(number: isHospitalize ? hyogo.hospitalize : hyogo.cases),
                            shimaneColor: viewModel.toLegendColor(number: isHospitalize ? shimane.hospitalize : shimane.cases),
                            tottoriColor: viewModel.toLegendColor(number: isHospitalize ? tottori.hospitalize : tottori.cases),
                            okayamaColor: viewModel.toLegendColor(number: isHospitalize ? okayama.hospitalize : okayama.cases),
                            hiroshimaColor: viewModel.toLegendColor(number: isHospitalize ? hiroshima.hospitalize : hiroshima.cases),
                            yamaguchiColor: viewModel.toLegendColor(number: isHospitalize ? yamaguchi.hospitalize : yamaguchi.cases),
                            kagawaColor: viewModel.toLegendColor(number: isHospitalize ? kagawa.hospitalize : kagawa.cases),
                            tokushimaColor: viewModel.toLegendColor(number: isHospitalize ? tokushima.hospitalize : tokushima.cases),
                            kochiColor: viewModel.toLegendColor(number: isHospitalize ? kochi.hospitalize : kochi.cases),
                            ehimeColor: viewModel.toLegendColor(number: isHospitalize ? ehime.hospitalize : ehime.cases),
                            oitaColor: viewModel.toLegendColor(number: isHospitalize ? oita.hospitalize : oita.cases),
                            miyazakiColor: viewModel.toLegendColor(number: isHospitalize ? miyazaki.hospitalize : miyazaki.cases),
                            kagoshimaColor: viewModel.toLegendColor(number: isHospitalize ? kagoshima.hospitalize : kagoshima.cases),
                            kumamotoColor: viewModel.toLegendColor(number: isHospitalize ? kumamoto.hospitalize : kumamoto.cases),
                            fukuokaColor: viewModel.toLegendColor(number: isHospitalize ? fukuoka.hospitalize : fukuoka.cases),
                            sagaColor: viewModel.toLegendColor(number: isHospitalize ? saga.hospitalize : saga.cases),
                            nagasakiColor: viewModel.toLegendColor(number: isHospitalize ? nagasaki.hospitalize : nagasaki.cases),
                            okinawaColor: viewModel.toLegendColor(number: isHospitalize ? okinawa.hospitalize : okinawa.cases))
    }
}
