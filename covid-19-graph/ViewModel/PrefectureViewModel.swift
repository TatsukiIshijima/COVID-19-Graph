//
//  PrefectureViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

final class PrefectureViewModel {
    private let covid19Repository: COVID19Repository
    private lazy var alertMapUseCase: AlertMapUseCase = AlertMapUseCase(alertMapView: self, covid19Repository: self.covid19Repository)

    init(repository: COVID19Repository) {
        covid19Repository = repository
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
        print("PrefectureViewModel: showError \(error)")
    }

    func showLoading() {
        print("PrefectureViewModel: showLoading")
    }

    func hideLoading() {
        print("PrefectureViewModel: hideLoading")
    }
}
