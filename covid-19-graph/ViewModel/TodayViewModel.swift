//
//  TodayViewModel.swift
//  covid-19-graph
//

import Core
import UIKit

final class TodayViewModel {
    // usecaseをメンバとして持たせるのはexecuteのクロージャで weak self を使用していて、
    // ローカル変数の場合では、クロージャに入った瞬間に解放されてしまうため
    private let covid19Repository: COVID19Repository
    private lazy var todayUseCase: TodayUseCase = TodayUseCase(todayView: self, covid19Repository: self.covid19Repository)

    init(repository: COVID19Repository) {
        covid19Repository = repository
    }

    func fetchTotal() {
        print("TodayViewModel: fetchTotal called.")
        todayUseCase.execute()
    }
}

extension TodayViewModel: TodayView {
    func showError() {
        print("TodayViewModel: showError")
    }

    func showLoading() {
        print("TodayViewModel: showLoading")
    }

    func hideLoading() {
        print("TodayViewModel: hideLoading")
    }

    func showTodayTotal() {
        print("TodayViewModel: showTodayTotal")
    }
}
