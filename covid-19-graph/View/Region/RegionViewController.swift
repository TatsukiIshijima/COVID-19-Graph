//
//  RegionViewController.swift
//  covid-19-graph
//

import Core
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
    @IBOutlet private weak var chugokuMapView: ChubuMapView!
    @IBOutlet private weak var shikokuMapView: ShikokuMapView!
    @IBOutlet private weak var kyushuMapView: KyushuMapView!

    private var regionDataViewController: RegionDataViewController?

    var region: RegionModel?
    var coordinator: RegionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.string.localizable.regionTitle()

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

        tohokuMapView.isHidden = true
        kantoMapView.isHidden = true
        chubuMapView.isHidden = true
        kinkiMapView.isHidden = true
        chugokuMapView.isHidden = true
        shikokuMapView.isHidden = true
        kyushuMapView.isHidden = true
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
