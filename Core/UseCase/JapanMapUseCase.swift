//
//  AlertMapUseCase.swift
//  Core
//

public final class JapanMapUseCase {
    private let alertMapView: AlertMapView
    private let covid19Repository: COVID19Repository

    public init(alertMapView: AlertMapView, covid19Repository: COVID19Repository) {
        self.alertMapView = alertMapView
        self.covid19Repository = covid19Repository
    }

    public func execute() {
        alertMapView.showLoading()
        covid19Repository.fetchPrefecture().startWithResult { [weak self] result in
            switch result {
            case let .success(response):
                // print("\(response)")
                print(response.toJapanMapModel())
                self?.alertMapView.fillPrefectures()
            case let .failure(error):
                self?.alertMapView.showError(error: error)
            }
            self?.alertMapView.hideLoading()
        }
    }
}

public protocol AlertMapView {
    func fillPrefectures()
    func showError(error: Error)
    func showLoading()
    func hideLoading()
}
