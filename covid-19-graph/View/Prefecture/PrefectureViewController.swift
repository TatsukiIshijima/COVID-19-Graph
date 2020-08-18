//
//  PrefectureViewController.swift
//  covid-19-graph
//

import SVProgressHUD
import UIKit

class PrefectureViewController: UIViewController {
    @IBOutlet private weak var japanMapView: JapanMapView!

    private var appContainer: AppContainer?
    private var viewModel: PrefectureViewModel?

    var coordinator: PrefectureCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController?.navigationBar.barTintColor = UIColor(named: R.color.primaryColor.name)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

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
            // TODO: データ構造変更
            self?.japanMapView.reDraw(hokkaidoColor: viewModel.toLegendColor(number: 1618),
                                      aomoriColor: viewModel.toLegendColor(number: 33),
                                      akitaColor: viewModel.toLegendColor(number: 42),
                                      iwateColor: viewModel.toLegendColor(number: 9),
                                      yamagataColor: viewModel.toLegendColor(number: 76),
                                      miyagiColor: viewModel.toLegendColor(number: 186),
                                      fukushimaColor: viewModel.toLegendColor(number: 109),
                                      ibarakiColor: viewModel.toLegendColor(number: 463),
                                      chibaColor: viewModel.toLegendColor(number: 2518),
                                      tochigiColor: viewModel.toLegendColor(number: 282),
                                      gunmaColor: viewModel.toLegendColor(number: 321),
                                      saitamaColor: viewModel.toLegendColor(number: 3276),
                                      tokyoColor: viewModel.toLegendColor(number: 18082),
                                      kanagawaColor: viewModel.toLegendColor(number: 3982),
                                      yamanashiColor: viewModel.toLegendColor(number: 148),
                                      nigataColor: viewModel.toLegendColor(number: 132),
                                      shizuokaColor: viewModel.toLegendColor(number: 424),
                                      naganoColor: viewModel.toLegendColor(number: 150),
                                      aichiColor: viewModel.toLegendColor(number: 3841),
                                      gifuColor: viewModel.toLegendColor(number: 520),
                                      toyamaColor: viewModel.toLegendColor(number: 323),
                                      ishikawaColor: viewModel.toLegendColor(number: 486),
                                      fukuiColor: viewModel.toLegendColor(number: 155),
                                      mieColor: viewModel.toLegendColor(number: 285),
                                      shigaColor: viewModel.toLegendColor(number: 354),
                                      naraColor: viewModel.toLegendColor(number: 429),
                                      wakayamaColor: viewModel.toLegendColor(number: 209),
                                      osakaColor: viewModel.toLegendColor(number: 7101),
                                      kyotoColor: viewModel.toLegendColor(number: 1164),
                                      hyogoColor: viewModel.toLegendColor(number: 1949),
                                      shimaneColor: viewModel.toLegendColor(number: 133),
                                      tottoriColor: viewModel.toLegendColor(number: 21),
                                      okayamaColor: viewModel.toLegendColor(number: 127),
                                      hiroshimaColor: viewModel.toLegendColor(number: 431),
                                      yamaguchiColor: viewModel.toLegendColor(number: 82),
                                      kagawaColor: viewModel.toLegendColor(number: 68),
                                      tokushimaColor: viewModel.toLegendColor(number: 95),
                                      kochiColor: viewModel.toLegendColor(number: 103),
                                      ehimeColor: viewModel.toLegendColor(number: 110),
                                      oitaColor: viewModel.toLegendColor(number: 120),
                                      miyazakiColor: viewModel.toLegendColor(number: 315),
                                      kagoshimaColor: viewModel.toLegendColor(number: 335),
                                      kumamotoColor: viewModel.toLegendColor(number: 416),
                                      fukuokaColor: viewModel.toLegendColor(number: 3717),
                                      sagaColor: viewModel.toLegendColor(number: 197),
                                      nagasakiColor: viewModel.toLegendColor(number: 189),
                                      okinawaColor: viewModel.toLegendColor(number: 1689))
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

        if Prefecture.hokkaido.path.contains(imageTapPoint) {
            japanMapView.reDraw(hokkaidoColor: .red,
                                yamagataColor: .yellow,
                                miyagiColor: .red)
            // coordinator?.goToRegion(prefecture: Prefecture.hokkaido)
        }
    }
}
