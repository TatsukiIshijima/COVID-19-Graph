//
//  AlertMapUseCase.swift
//  Core
//

public final class JapanMapUseCase {
    private let prefectureView: PrefectureView
    private let covid19Repository: COVID19Repository

    public init(alertMapView: PrefectureView, covid19Repository: COVID19Repository) {
        prefectureView = alertMapView
        self.covid19Repository = covid19Repository
    }

    public func execute() {
        prefectureView.showLoading()
        covid19Repository.fetchPrefecture().startWithResult { [weak self] result in
            switch result {
            case let .success(response):
                // print(response.toJapanMapModel())
                self?.prefectureView.fillPrefectures(model: response.toJapanMapModel())
            case let .failure(error):
                self?.prefectureView.showError(error: error)
            }
            self?.prefectureView.hideLoading()
        }
    }
}

public protocol PrefectureView: ErrorView, LoadingView {
    func fillPrefectures(model: JapanMapModel)
}
