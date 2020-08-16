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
                if let usecase = self {
                    let models = usecase.toTodayModels(response: response)
                    usecase.todayView.showTodayTotal(todayModels: models)
                }
            case let .failure(error):
                self?.todayView.showError(error: error)
            }
            self?.todayView.hideLoading()
        }
    }

    func toTodayModels(response: (TotalResponse, TotalHistoryResponse)) -> [TodayModel] {
        var models: [TodayModel] = []
        let pcrs = response.1.history.compactMap { $0.pcr }.suffix(30)
        let positives = response.1.history.compactMap { $0.positive }.suffix(30)
        let disCharges = response.1.history.compactMap { $0.discharge }.suffix(30)
        let deathes = response.1.history.compactMap { $0.death }.suffix(30)

        let pcrDiff = toDiffArray(array: pcrs)
        let positiveDiff = toDiffArray(array: positives)
        let disChargeDiff = toDiffArray(array: disCharges)
        let deathDiff = toDiffArray(array: deathes)

        models.append(TodayModel(num: response.0.pcr, history: pcrDiff))
        models.append(TodayModel(num: response.0.positive, history: positiveDiff))
        models.append(TodayModel(num: response.0.discharge, history: disChargeDiff))
        models.append(TodayModel(num: response.0.death, history: deathDiff))
        return models
    }

    private func toDiffArray(array: ArraySlice<Int>) -> [Int] {
        return zip(array.indices, array).map { (index: Int, value: Int) -> Int in
            if index + 1 >= array.endIndex {
                return 0
            }
            let forwardValue = array[index + 1]
            let diff = forwardValue - value > 0 ? forwardValue - value : 0
            return diff
        }
    }
}

public protocol TodayView {
    func showTodayTotal(todayModels: [TodayModel])
    func showError(error: Error)
    func showLoading()
    func hideLoading()
}
