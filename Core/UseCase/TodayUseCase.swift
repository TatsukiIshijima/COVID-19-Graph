//
//  TodayUseCase.swift
//  Core
//

public final class TodayUseCase {
    private let todayView: TodayView
    private let covid19Repository: COVID19Repository

    public init(todayView: TodayView, covid19Repository: COVID19Repository) {
        self.todayView = todayView
        self.covid19Repository = covid19Repository
    }

    public func execute() {
        todayView.showLoading()
        let fetchTotal = covid19Repository.fetchTotal()
        let fetchTotalHistory = covid19Repository.fetchTotalHistory()
        let fetchTotalZip = fetchTotal.zip(with: fetchTotalHistory)
        fetchTotalZip.startWithResult { [weak self] result in
            switch result {
            case let .success(response):
                self?.todayView.showTodayTotal(response: response)
            case let .failure(error):
                self?.todayView.showError(error: error)
            }
            self?.todayView.hideLoading()
        }
    }
}

public protocol TodayView {
    func showTodayTotal(response: (TotalResponse, TotalHistoryResponse))
    func showError(error: Error)
    func showLoading()
    func hideLoading()
}