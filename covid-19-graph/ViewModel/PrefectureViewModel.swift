//
//  PrefectureViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

final class PrefectureViewModel {
    private let covid19Repository: COVID19Repository
    private lazy var alertMapUseCase: JapanMapUseCase = JapanMapUseCase(alertMapView: self, covid19Repository: self.covid19Repository)

    private let alertMapErrorMutableProperty: MutableProperty<Error?>
    private let loadingMutableProperty: MutableProperty<Bool>

    let alertMapErrorProperty: Property<Error?>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository

        alertMapErrorMutableProperty = MutableProperty(nil)
        loadingMutableProperty = MutableProperty(false)

        alertMapErrorProperty = Property(capturing: alertMapErrorMutableProperty)
        loadingProperty = Property(capturing: loadingMutableProperty)
    }

    func drawPrefectures() {
        alertMapUseCase.execute()
    }
}

extension PrefectureViewModel: AlertMapView {
    func fillPrefectures() {
        print("PrefectureViewModel: fillPrefectures")
    }

    func showError(error: Error) {
        print("PrefectureViewModel: showError")
        alertMapErrorMutableProperty.value = error
    }

    func showLoading() {
        print("PrefectureViewModel: showLoading")
        loadingMutableProperty.value = true
    }

    func hideLoading() {
        print("PrefectureViewModel: hideLoading")
        loadingMutableProperty.value = false
    }
}
