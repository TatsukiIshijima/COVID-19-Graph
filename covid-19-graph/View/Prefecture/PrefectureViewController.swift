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

        viewModel.alertMapErrorProperty.signal.observeValues { error in
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
            japanMapView.fillPrefecture()
            coordinator?.goToRegion(prefecture: Prefecture.hokkaido)
        }
    }
}
