//
//  ErrorViewController.swift
//  covid-19-graph
//

import Core
import Foundation
import UIKit

class ErrorViewController<ViewModel: ErrorViewModel>: UIViewController {
    var viewModel: ViewModel?
    var retryAction: ((UIAlertAction) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = R.color.primaryColor()!
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        errorHandling()
    }

    func errorHandling() {
        viewModel?.errorProperty.signal.observeValues { error in
            guard let error = error else {
                return
            }
            if error is DecodingError {
                self.showDefaultAlert(title: R.string.localizable.generalErrorTitle(),
                                      message: String(format: NSLocalizedString(R.string.localizable.generalErrorTitle.key,
                                                                                comment: "1001")))
            }
            if let apiError = error as? APIError {
                switch apiError {
                case .timeout:
                    self.showRetryAlert()
                case .noResponse:
                    self.showDefaultAlert(title: R.string.localizable.apiErrorTitle(),
                                          message: String(format: NSLocalizedString(R.string.localizable.generalErrorTitle.key,
                                                                                    comment: "4001")))
                case .forbidden:

                    self.showDefaultAlert(title: R.string.localizable.apiErrorTitle(),
                                          message: R.string.localizable.forbiddenMessage())
                case .notFound:
                    self.showDefaultAlert(title: R.string.localizable.apiErrorTitle(),
                                          message: R.string.localizable.notFoundMessage())
                case .internalServerError:
                    self.showDefaultAlert(title: R.string.localizable.apiErrorTitle(),
                                          message: R.string.localizable.internalServerErrorMessage())
                }
            }
        }
    }
}

extension ErrorViewController {
    func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: R.string.localizable.positiveButton(),
                                          style: .default,
                                          handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

    func showRetryAlert() {
        let alert = UIAlertController(title: R.string.localizable.generalErrorTitle(),
                                      message: R.string.localizable.timeoutMessage(),
                                      preferredStyle: .alert)
        let positiveAction = UIAlertAction(title: R.string.localizable.retryButton(),
                                           style: .default,
                                           handler: retryAction)
        let negativeAction = UIAlertAction(title: R.string.localizable.negativeButton(),
                                           style: .default,
                                           handler: nil)
        alert.addAction(positiveAction)
        alert.addAction(negativeAction)
        present(alert, animated: true, completion: nil)
    }
}
