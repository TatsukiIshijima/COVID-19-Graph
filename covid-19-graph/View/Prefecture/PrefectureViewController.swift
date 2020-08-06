//
//  PrefectureViewController.swift
//  covid-19-graph
//

import UIKit

class PrefectureViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!

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
        collectionView.register(R.nib.barGrapheCollectionViewCell)
        collectionView.register(R.nib.circleGraphCollectionViewCell)
    }
}

extension PrefectureViewController: UICollectionViewDelegate {}

extension PrefectureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let barGraphCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.barGraphCollectionViewCell, for: indexPath) else {
                fatalError()
            }
            barGraphCell.backgroundColor = .gray
            return barGraphCell
        case 1:
            guard let circleGraphCell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.circleGraphCollectionViewCell, for: indexPath) else {
                fatalError()
            }
            circleGraphCell.backgroundColor = .gray
            return circleGraphCell
        default:
            return UICollectionViewCell()
        }
    }
}

extension PrefectureViewController: UICollectionViewDelegateFlowLayout {
    // セルの大きさ設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = 125
        return CGSize(width: width, height: height)
    }

    // セッションごとのマージン設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    // セル間のマージン設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
}
