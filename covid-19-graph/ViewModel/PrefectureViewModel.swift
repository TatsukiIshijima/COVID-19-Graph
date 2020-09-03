//
//  PrefectureViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift
import UIKit

final class PrefectureViewModel: ErrorViewModel {
    private let covid19Repository: COVID19Repository
    private lazy var japanMapUseCase: JapanMapUseCase = JapanMapUseCase(alertMapView: self, covid19Repository: self.covid19Repository)

    private let japanMapDataMutableProperty: MutableProperty<JapanMapModel?>
    private let loadingMutableProperty: MutableProperty<Bool>

    let japanMapDataProperty: Property<JapanMapModel?>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository

        japanMapDataMutableProperty = MutableProperty(nil)
        loadingMutableProperty = MutableProperty(false)

        japanMapDataProperty = Property(capturing: japanMapDataMutableProperty)
        loadingProperty = Property(capturing: loadingMutableProperty)
    }

    func drawPrefectures() {
        japanMapUseCase.execute()
    }
}

extension PrefectureViewModel: PrefectureView {
    func fillPrefectures(model: JapanMapModel) {
        japanMapDataMutableProperty.value = model
    }

    func showLoading() {
        loadingMutableProperty.value = true
    }

    func hideLoading() {
        loadingMutableProperty.value = false
    }
}
