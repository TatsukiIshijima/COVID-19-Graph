//
//  TodayViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

final class TodayViewModel: ErrorViewModel {
    // usecaseをメンバとして持たせるのはexecuteのクロージャで weak self を使用していて、
    // ローカル変数の場合では、クロージャに入った瞬間に解放されてしまうため
    private let covid19Repository: COVID19Repository
    private lazy var todayUseCase: TodayUseCase = TodayUseCase(todayView: self, covid19Repository: self.covid19Repository)
    private let todayModelsMutableProperty: MutableProperty<[TodayModel]>
    private let loadingMutableProperty: MutableProperty<Bool>

    let todayModelsProperty: Property<[TodayModel]>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository
        todayModelsMutableProperty = MutableProperty([])
        loadingMutableProperty = MutableProperty(false)
        todayModelsProperty = Property(capturing: todayModelsMutableProperty)
        loadingProperty = Property(capturing: loadingMutableProperty)
        super.init()
    }

    func fetchTotal() {
        todayUseCase.execute()
    }
}

extension TodayViewModel: TodayView {
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
