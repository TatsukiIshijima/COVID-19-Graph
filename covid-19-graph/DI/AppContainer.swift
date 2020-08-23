//
//  AppContainer.swift
//  covid-19-graph
//

import Core

final class AppContainer {
    private let covid19Client: COVID19Client = COVID19Client()
    private let covid19Repository: COVID19Repository

    lazy var todayContainer: TodayContainer? = TodayContainer(repository: covid19Repository)
    lazy var prefectureContainer: PrefectureContainer? = PrefectureContainer(respository: covid19Repository)

    init() {
        covid19Repository = COVID19Repository(client: covid19Client)
    }
}

protocol Factory {
    func build<T: BaseViewModel>() -> T?
}
