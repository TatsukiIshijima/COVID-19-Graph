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
}

extension PrefectureContainer: Factory {
    func build<T>() -> T? where T: BaseViewModel {
        return PrefectureViewModel(repository: covid19Repository) as? T
    }
}
