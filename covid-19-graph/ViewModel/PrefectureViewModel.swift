//
//  PrefectureViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift
import UIKit

final class PrefectureViewModel {
    private let covid19Repository: COVID19Repository
    private lazy var alertMapUseCase: JapanMapUseCase = JapanMapUseCase(alertMapView: self, covid19Repository: self.covid19Repository)

    private let japanMapDataMutableProperty: MutableProperty<JapanMapModel?>
    private let japanMapDataErrorMutableProperty: MutableProperty<Error?>
    private let loadingMutableProperty: MutableProperty<Bool>

    let japanMapDataProperty: Property<JapanMapModel?>
    let japanMapDataErrorProperty: Property<Error?>
    let loadingProperty: Property<Bool>

    init(repository: COVID19Repository) {
        covid19Repository = repository

        japanMapDataMutableProperty = MutableProperty(nil)
        japanMapDataErrorMutableProperty = MutableProperty(nil)
        loadingMutableProperty = MutableProperty(false)

        japanMapDataProperty = Property(capturing: japanMapDataMutableProperty)
        japanMapDataErrorProperty = Property(capturing: japanMapDataErrorMutableProperty)
        loadingProperty = Property(capturing: loadingMutableProperty)
    }

    func drawPrefectures() {
        alertMapUseCase.execute()
    }

    func toLegendColor(number: Int) -> UIColor {
        if number > 1000 {
            return R.color.dangerColor1() ?? .red
        } else if number > 500, number <= 1000 {
            return R.color.dangerColor2() ?? .red
        } else if number > 100, number <= 500 {
            return R.color.dangerColor3() ?? .red
        } else if number > 50, number <= 100 {
            return R.color.dangerColor4() ?? .orange
        } else if number > 10, number <= 50 {
            return R.color.dangerColor5() ?? .orange
        } else if number > 0, number <= 10 {
            return R.color.dangerColor6() ?? .yellow
        } else {
            return R.color.dangerColor7() ?? .lightGray
        }
    }
}

extension PrefectureViewModel: AlertMapView {
    func fillPrefectures(model: JapanMapModel) {
        japanMapDataMutableProperty.value = model
    }

    func showError(error: Error) {
        print("PrefectureViewModel: showError")
        japanMapDataErrorMutableProperty.value = error
    }

    func showLoading() {
        loadingMutableProperty.value = true
    }

    func hideLoading() {
        loadingMutableProperty.value = false
    }
}
