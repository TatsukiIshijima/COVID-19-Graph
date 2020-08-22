//
//  PrefectureViewController.swift
//  covid-19-graph
//

import Core
import Segmentio
import SVProgressHUD
import UIKit

class PrefectureViewController: UIViewController {
    @IBOutlet private weak var segmentioView: Segmentio!
    @IBOutlet private weak var japanMapView: JapanMapView!

    private var appContainer: AppContainer?
    private var viewModel: PrefectureViewModel?

    var coordinator: PrefectureCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let navigationController = self.navigationController
            else {
                fatalError("Cloud not get NavigationController.")
        }

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController.navigationBar.barTintColor = R.color.primaryColor()!
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        // NavigationBarの下線を削除
        navigationController.navigationBar.shadowImage = UIImage()

        setupSegmentio()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate is nil.")
        }

        appContainer = appDelegate.appContainer

        guard let appContainer = self.appContainer else {
            fatalError("AppContainer is nil.")
        }

        appContainer.prefectureContainer = PrefectureContainer(respository: appContainer.covid19Repository)
        viewModel = appContainer.prefectureContainer?.create()

        guard let viewModel = viewModel else {
            fatalError("PrefectureViewModel is nil.")
        }

        viewModel.japanMapDataProperty.signal.observeValues { [weak self] japanMapModel in
            guard let model = japanMapModel else {
                return
            }
            self?.drawJapanMap(model: model)
        }

        viewModel.japanMapDataErrorProperty.signal.observeValues { error in
            guard let error = error else {
                return
            }
            print("AlertMapError : \(error)")
        }
        viewModel.loadingProperty.signal.observeValues { isLoading in
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }

        viewModel.drawPrefectures()

        japanMapView.isUserInteractionEnabled = true

        let selector = #selector(PrefectureViewController.tapAction(_:))
        japanMapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appContainer?.prefectureContainer = nil
    }

    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        let originalTapPoint = sender.location(in: japanMapView)
        // 以下は元画像のサイズ
        let imageWidth: CGFloat = japanMapView.originalWidth
        let imageHeight: CGFloat = japanMapView.originalHeight

        let imageTapPoint = CGPoint(x: imageWidth / japanMapView.frame.width * originalTapPoint.x, y: imageHeight / japanMapView.frame.height * originalTapPoint.y)

        //        if Prefecture.hokkaido.path.contains(imageTapPoint) {
        //            japanMapView.reDraw(hokkaidoColor: .red,
        //                                yamagataColor: .yellow,
        //                                miyagiColor: .red)
        //            coordinator?.goToRegion(prefecture: Prefecture.hokkaido)
        //        }
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

        segmentioView.setup(content: [SegmentioItem(title: "現在", image: nil),
                                      SegmentioItem(title: "累計", image: nil)],
                            style: .onlyLabel,
                            options: segmentioOptions)

        segmentioView.selectedSegmentioIndex = 0
    }
}

extension PrefectureViewController {
    private func drawJapanMap(model: JapanMapModel) {
        guard let hokkaido = model.hokkaido.prefectures[.hokkaido],
            let aomori = model.tohoku.prefectures[.aomori],
            let akita = model.tohoku.prefectures[.akita],
            let iwate = model.tohoku.prefectures[.iwate],
            let yamagata = model.tohoku.prefectures[.yamagata],
            let miyagi = model.tohoku.prefectures[.miyagi],
            let fukushima = model.tohoku.prefectures[.fukushima],
            let ibaraki = model.kanto.prefectures[.ibaraki],
            let chiba = model.kanto.prefectures[.chiba],
            let tochigi = model.kanto.prefectures[.tochigi],
            let gunma = model.kanto.prefectures[.gunma],
            let saitama = model.kanto.prefectures[.saitama],
            let tokyo = model.kanto.prefectures[.tokyo],
            let kanagawa = model.kanto.prefectures[.kanagawa],
            let yamanashi = model.tyubu.prefectures[.yamanashi],
            let nigata = model.tyubu.prefectures[.nigata],
            let shizuoka = model.tyubu.prefectures[.shizuoka],
            let nagano = model.tyubu.prefectures[.nagano],
            let aichi = model.tyubu.prefectures[.aichi],
            let gifu = model.tyubu.prefectures[.gifu],
            let toyama = model.tyubu.prefectures[.toyama],
            let ishikawa = model.tyubu.prefectures[.ishikawa],
            let fukui = model.tyubu.prefectures[.fukui],
            let mie = model.kinki.prefectures[.mie],
            let shiga = model.kinki.prefectures[.shiga],
            let nara = model.kinki.prefectures[.nara],
            let wakayama = model.kinki.prefectures[.wakayama],
            let osaka = model.kinki.prefectures[.osaka],
            let kyoto = model.kinki.prefectures[.kyoto],
            let hyogo = model.kinki.prefectures[.hyugo],
            let shimane = model.tyugoku.prefectures[.shimane],
            let tottori = model.tyugoku.prefectures[.tottori],
            let okayama = model.tyugoku.prefectures[.okayama],
            let hiroshima = model.tyugoku.prefectures[.hiroshima],
            let yamaguchi = model.tyugoku.prefectures[.yamaguchi],
            let kagawa = model.shikoku.prefectures[.kagawa],
            let tokushima = model.shikoku.prefectures[.tokushima],
            let kochi = model.shikoku.prefectures[.kouchi],
            let ehime = model.shikoku.prefectures[.ehime],
            let oita = model.kyusyu.prefectures[.oita],
            let miyazaki = model.kyusyu.prefectures[.miyazaki],
            let kagoshima = model.kyusyu.prefectures[.kagoshima],
            let kumamoto = model.kyusyu.prefectures[.kumamoto],
            let fukuoka = model.kyusyu.prefectures[.fukuoka],
            let saga = model.kyusyu.prefectures[.saga],
            let nagasaki = model.kyusyu.prefectures[.nagasaki],
            let okinawa = model.kyusyu.prefectures[.okinawa]
            else {
                return
        }

        guard let viewModel = self.viewModel else {
            return
        }

        // hospitalize が現在 positive が累計
        japanMapView.reDraw(hokkaidoColor: viewModel.toLegendColor(number: hokkaido.hospitalize),
                            aomoriColor: viewModel.toLegendColor(number: aomori.hospitalize),
                            akitaColor: viewModel.toLegendColor(number: akita.hospitalize),
                            iwateColor: viewModel.toLegendColor(number: iwate.hospitalize),
                            yamagataColor: viewModel.toLegendColor(number: yamagata.hospitalize),
                            miyagiColor: viewModel.toLegendColor(number: miyagi.hospitalize),
                            fukushimaColor: viewModel.toLegendColor(number: fukushima.hospitalize),
                            ibarakiColor: viewModel.toLegendColor(number: ibaraki.hospitalize),
                            chibaColor: viewModel.toLegendColor(number: chiba.hospitalize),
                            tochigiColor: viewModel.toLegendColor(number: tochigi.hospitalize),
                            gunmaColor: viewModel.toLegendColor(number: gunma.hospitalize),
                            saitamaColor: viewModel.toLegendColor(number: saitama.hospitalize),
                            tokyoColor: viewModel.toLegendColor(number: tokyo.hospitalize),
                            kanagawaColor: viewModel.toLegendColor(number: kanagawa.hospitalize),
                            yamanashiColor: viewModel.toLegendColor(number: yamanashi.hospitalize),
                            nigataColor: viewModel.toLegendColor(number: nigata.hospitalize),
                            shizuokaColor: viewModel.toLegendColor(number: shizuoka.hospitalize),
                            naganoColor: viewModel.toLegendColor(number: nagano.hospitalize),
                            aichiColor: viewModel.toLegendColor(number: aichi.hospitalize),
                            gifuColor: viewModel.toLegendColor(number: gifu.hospitalize),
                            toyamaColor: viewModel.toLegendColor(number: toyama.hospitalize),
                            ishikawaColor: viewModel.toLegendColor(number: ishikawa.hospitalize),
                            fukuiColor: viewModel.toLegendColor(number: fukui.hospitalize),
                            mieColor: viewModel.toLegendColor(number: mie.hospitalize),
                            shigaColor: viewModel.toLegendColor(number: shiga.hospitalize),
                            naraColor: viewModel.toLegendColor(number: nara.hospitalize),
                            wakayamaColor: viewModel.toLegendColor(number: wakayama.hospitalize),
                            osakaColor: viewModel.toLegendColor(number: osaka.hospitalize),
                            kyotoColor: viewModel.toLegendColor(number: kyoto.hospitalize),
                            hyogoColor: viewModel.toLegendColor(number: hyogo.hospitalize),
                            shimaneColor: viewModel.toLegendColor(number: shimane.hospitalize),
                            tottoriColor: viewModel.toLegendColor(number: tottori.hospitalize),
                            okayamaColor: viewModel.toLegendColor(number: okayama.hospitalize),
                            hiroshimaColor: viewModel.toLegendColor(number: hiroshima.hospitalize),
                            yamaguchiColor: viewModel.toLegendColor(number: yamaguchi.hospitalize),
                            kagawaColor: viewModel.toLegendColor(number: kagawa.hospitalize),
                            tokushimaColor: viewModel.toLegendColor(number: tokushima.hospitalize),
                            kochiColor: viewModel.toLegendColor(number: kochi.hospitalize),
                            ehimeColor: viewModel.toLegendColor(number: ehime.hospitalize),
                            oitaColor: viewModel.toLegendColor(number: oita.hospitalize),
                            miyazakiColor: viewModel.toLegendColor(number: miyazaki.hospitalize),
                            kagoshimaColor: viewModel.toLegendColor(number: kagoshima.hospitalize),
                            kumamotoColor: viewModel.toLegendColor(number: kumamoto.hospitalize),
                            fukuokaColor: viewModel.toLegendColor(number: fukuoka.hospitalize),
                            sagaColor: viewModel.toLegendColor(number: saga.hospitalize),
                            nagasakiColor: viewModel.toLegendColor(number: nagasaki.hospitalize),
                            okinawaColor: viewModel.toLegendColor(number: okinawa.hospitalize))
    }
}
