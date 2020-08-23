//
//  ErrorViewController.swift
//  covid-19-graph
//

import Foundation
import UIKit

class ErrorViewController<ViewModel: ErrorViewModel>: UIViewController {
    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = R.color.primaryColor()!
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        viewModel?.errorProperty.signal.observeValues { error in
            if let error = error {
                print("ErrorViewController: \(error)")
            }
        }
    }
}
