//
//  TodayViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

final class TodayViewModel {
    // usecaseをメンバとして持たせるのはexecuteのクロージャで weak self を使用していて、
    // ローカル変数の場合では、クロージャに入った瞬間に解放されてしまうため
    private let covid19Repository: COVID19Repository
    private lazy var todayUseCase: TodayUseCase = TodayUseCase(todayView: self, covid19Repository: self.covid19Repository)
    private let totalMutableProperty: MutableProperty<TotalResponse?>
    private let totalHistoryMutableProperty: MutableProperty<TotalHistoryResponse?>
    private let totalErrorMutableProperty: MutableProperty<Error?>
    private let loadingMutableProperty: MutableProperty<Bool>

    let totalProperty: Property<TotalResponse?>
    let totalHistoryProperty: Property<TotalHistoryResponse?>
    let totalErrorProperty: Property<Error?>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository
        totalMutableProperty = MutableProperty(nil)
        totalHistoryMutableProperty = MutableProperty(nil)
        totalErrorMutableProperty = MutableProperty(nil)
        loadingMutableProperty = MutableProperty(false)
        totalProperty = Property(capturing: totalMutableProperty)
        totalHistoryProperty = Property(capturing: totalHistoryMutableProperty)
        totalErrorProperty = Property(capturing: totalErrorMutableProperty)
        loadingProperty = Property(capturing: loadingMutableProperty)
    }

    func fetchTotal() {
        print("TodayViewModel: fetchTotal called.")
        todayUseCase.execute()
    }
}

extension TodayViewModel: TodayView {
    func showError(error: Error) {
        print("TodayViewModel: showError")
        totalErrorMutableProperty.value = error
    }

    func showLoading() {
        print("TodayViewModel: showLoading")
        loadingMutableProperty.value = true
    }

    func hideLoading() {
        print("TodayViewModel: hideLoading")
        loadingMutableProperty.value = false
    }

    func showTodayTotal(response: (TotalResponse, TotalHistoryResponse)) {
        print("TodayViewModel: showTodayTotal")
        totalMutableProperty.value = response.0
        totalHistoryMutableProperty.value = response.1
    }
}
