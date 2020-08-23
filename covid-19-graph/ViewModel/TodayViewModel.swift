//
//  TodayViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

final class TodayViewModel: BaseViewModel {
    // usecaseをメンバとして持たせるのはexecuteのクロージャで weak self を使用していて、
    // ローカル変数の場合では、クロージャに入った瞬間に解放されてしまうため
    private let covid19Repository: COVID19Repository
    private lazy var todayUseCase: TodayUseCase = TodayUseCase(todayView: self, covid19Repository: self.covid19Repository)
    private let todayModelsMutableProperty: MutableProperty<[TodayModel]>
    private let totalErrorMutableProperty: MutableProperty<Error?>
    private let loadingMutableProperty: MutableProperty<Bool>

    let todayModelsProperty: Property<[TodayModel]>
    let totalErrorProperty: Property<Error?>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository
        todayModelsMutableProperty = MutableProperty([])
        totalErrorMutableProperty = MutableProperty(nil)
        loadingMutableProperty = MutableProperty(false)
        todayModelsProperty = Property(capturing: todayModelsMutableProperty)
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

    func showTodayTotal(todayModels: [TodayModel]) {
        print("TodayViewModel: showTodayTotal")
        todayModelsMutableProperty.value = todayModels
    }
}
