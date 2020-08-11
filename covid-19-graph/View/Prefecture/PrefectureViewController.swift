//
//  PrefectureViewController.swift
//  covid-19-graph
//

import UIKit

class PrefectureViewController: UIViewController {
    @IBOutlet private weak var japanMapView: JapanMapView!

    var coordinator: PrefectureCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController?.navigationBar.barTintColor = UIColor(named: R.color.primaryColor.name)
        navigationController?.navigationBar.tintColor = .white
        // navigationController?.navigationBar.prefersLargeTitles = true
        // navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        japanMapView.isUserInteractionEnabled = true

        let selector = #selector(PrefectureViewController.tapAction(_:))
        japanMapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
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
