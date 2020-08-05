//
//  AppContainer.swift
//  covid-19-graph
//

import Core
import Foundation

class AppContainer {
    private let covid19Client = COVID19Client()

    let covid19Repository: COVID19Repository

    init() {
        covid19Repository = COVID19Repository(client: covid19Client)
    }
}
