//
//  AppContainer.swift
//  covid-19-graph
//

import Core

final class AppContainer {
    private let covid19Client: COVID19Client = COVID19Client()

    let covid19Repository: COVID19Repository

    var todayContainer: TodayContainer?
    var prefectureContainer: PrefectureContainer?

    init() {
        covid19Repository = COVID19Repository(client: covid19Client)
    }
}
