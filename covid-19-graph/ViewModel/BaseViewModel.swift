//
//  BaseViewModel.swift
//  covid-19-graph
//

import Core
import ReactiveSwift

protocol BaseViewModel {}

class ErrorViewModel: BaseViewModel {
    let errorMutableProperty: MutableProperty<Error?>
    let errorProperty: Property<Error?>

    init() {
        errorMutableProperty = MutableProperty(nil)
        errorProperty = Property(capturing: errorMutableProperty)
    }
}

extension ErrorViewModel: ErrorView {
    func showError(error: Error) {
        errorMutableProperty.value = error
    }
}
