//
//  TotalViewController.swift
//  covid-19-graph
//

import SVProgressHUD
import UIKit

final class TodayViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!

    private var appContainer: AppContainer?
    private var viewModel: TodayViewModel?

    var coordinator: TodayCoordinator?

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

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(R.nib.todayCollectionViewCell)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate is nil.")
        }

        appContainer = appDelegate.appContainer

        guard let appContainer = self.appContainer else {
            fatalError("AppContaner is nil.")
        }

        appContainer.todayContainer = TodayContainer(repository: appContainer.covid19Repository)
        viewModel = appContainer.todayContainer?.create()

        guard let viewModel = viewModel else {
            fatalError("TotalViewModel is nil.")
        }

        viewModel.totalProperty.signal.observeValues { total in
            print(total ?? "total is nil.")
        }
        viewModel.totalHistoryProperty.signal.observeValues { history in
            print(history ?? "history is nil.")
        }
        viewModel.totalErrorProperty.signal.observeValues { error in
            print(error ?? "total error is nil.")
        }
        viewModel.loadingProperty.signal.observeValues { isLoading in
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }

        viewModel.fetchTotal()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appContainer?.todayContainer = nil
    }
}

extension TodayViewController: UICollectionViewDelegate {}

extension TodayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let todayCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.todayCollectionViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.todayCollectionViewCell)")
        }
        var color: UIColor = .gray
        switch indexPath.row {
        case 0:
            color = R.color.orange() ?? .gray
        case 1:
            color = R.color.primaryColor() ?? .gray
        case 2:
            color = R.color.green() ?? .gray
        case 3:
            color = R.color.navy() ?? .gray
        default:
            color = .gray
        }
        todayCollectionViewCell.setContent(backgroundColor: color, num: 1000, title: "参加人数")
        return todayCollectionViewCell
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    // セルの大きさ設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width - 48
        let height: CGFloat = 125
        return CGSize(width: width, height: height)
    }

    // セッションごとのマージン設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
    }

    // セル間のマージン設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
}
