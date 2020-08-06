//
//  TotalViewController.swift
//  covid-19-graph
//

import UIKit

final class TodayViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
         fatalError("AppDelegate is nil.")
         }

         appDelegate.appContainer.covid19Repository.fetchTotal().startWithResult { result in
         switch result {
         case let .success(total):
         print("FetchTotal Success \(total.date)")
         case let .failure(error):
         print("FetchTotal Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchTotalHistory().startWithResult { result in
         switch result {
         case let .success(totalHistory):
         print("FetchTotalHistory Success \(totalHistory.history.count)")
         case let .failure(error):
         print("FetchTotalHistory Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchTotalPrediction().startWithResult { result in
         switch result {
         case let .success(totalPrediction):
         print("FetchTotalPrediction Success \(totalPrediction.total.count)")
         case let .failure(error):
         print("FetchTotalPrediction Error \(error)")
         }
         }

         appDelegate.appContainer.covid19Repository.fetchStatistics().startWithResult { result in
         switch result {
         case let .success(prefecture):
         print("FetchStatistics Success \(prefecture.all.count) \(prefecture.all[0].male.generationsCount.generation00s)")
         case let .failure(error):
         print("FetchStatistics Error \(error)")
         }
         }
         */

        // TODO: この辺りはTabBarで使用する画面としてまとめたい
        navigationController?.navigationBar.barTintColor = UIColor(named: R.color.mainColor.name)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(R.nib.todayCollectionViewCell)
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
        todayCollectionViewCell.setContent(backgroundColor: .lightGray, num: 1000, title: "ほげ")
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
