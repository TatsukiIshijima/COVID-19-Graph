//
//  TodayContainer.swift
//  covid-19-graph
//

import Core
import Foundation

final class TodayContainer {
    // コンテナの生存期間をViewControllerのライフサイクルに合わせ、
    // ViewControllerのDisapplerでコンテナ破棄を行う
    // ViewControllerでは必要なものを大元のAppContainerから取得し
    // ContainerをからViewModelを生成させる

    private let covid19Repository: COVID19Repository

    init(repository: COVID19Repository) {
        covid19Repository = repository
    }

    func create() -> TodayViewModel {
        return TodayViewModel(repository: covid19Repository)
    }
}
