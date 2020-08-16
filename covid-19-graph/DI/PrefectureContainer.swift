//
//  PrefectureContainer.swift
//  covid-19-graph
//

import Core
import Foundation

final class PrefectureContainer {
    private let covid19Repository: COVID19Repository

    init(respository: COVID19Repository) {
        covid19Repository = respository
    }

    func create() -> PrefectureViewModel {
        return PrefectureViewModel(repository: covid19Repository)
    }
}
