//
//  FactoryProtocol.swift
//  covid-19-graph
//

import Foundation

protocol Factory {
    func create<ViewModel>() -> ViewModel
}
