//
//  TotalViewController.swift
//  covid-19-graph
//

import Core
import SVProgressHUD
import UIKit

final class TodayViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!

    private var viewModel: TodayViewModel?
    private var todays: [TodayModel] = []

    var coordinator: TodayCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        title = R.string.localizable.todayTitle()
        navigationController?.navigationBar.barTintColor = R.color.primaryColor()!
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(R.nib.todayCollectionViewCell)
        collectionView.register(UINib(resource: R.nib.todayCollectionReusableView),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: R.reuseIdentifier.todayCollectionReusableView.identifier)

        viewModel = AppDelegate.shared.appContainer.todayContainer?.build()

        guard let viewModel = viewModel else {
            fatalError("TotalViewModel is nil.")
        }

        viewModel.todayModelsProperty.signal.observeValues { [weak self] value in
            self?.todays = value
            self?.collectionView.reloadData()
        }
        viewModel.errorProperty.signal.observeValues { error in
            if let error = error {
                print("TotalViewError: \(error)")
            }
        }
        viewModel.loadingProperty.signal.observeValues { isLoading in
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }

        viewModel.fetchTotal()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        AppDelegate.shared.appContainer.todayContainer = nil
    }
}

extension TodayViewController: UICollectionViewDelegate {}

extension TodayViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: R.reuseIdentifier.todayCollectionReusableView, for: indexPath) else {
            fatalError("Cloud not get TodayCollectionResuableView")
        }
        return header
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todays.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let todayCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.todayCollectionViewCell, for: indexPath) else {
            fatalError("failed to dequeue with \(R.reuseIdentifier.todayCollectionViewCell)")
        }
        var color: UIColor = .gray
        var title: String = ""
        switch indexPath.row {
        case 0:
            color = R.color.orange()!
            title = R.string.localizable.pcrNumTitle()
        case 1:
            color = R.color.primaryColor()!
            title = R.string.localizable.positiveNumTitle()
        case 2:
            color = R.color.green()!
            title = R.string.localizable.dischargeNumTitle()
        case 3:
            color = R.color.navy()!
            title = R.string.localizable.deathNumTitle()
        default: break
        }
        todayCollectionViewCell.setContent(backgroundColor: color,
                                           num: todays[indexPath.row].num,
                                           rawData: todays[indexPath.row].history,
                                           title: title)
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

    // ヘッダーの大きさ設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = 225
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
