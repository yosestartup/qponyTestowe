//
//  DIResolver+CurrencyDetail.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - CurrencyDetail
protocol CurrencyDetailProtocol {
    func presentCurrencyDetailViewController() -> UIViewController
}

extension DIResolver: CurrencyDetailProtocol {
    func presentCurrencyDetailViewController() -> UIViewController {
        let viewController = CurrencyDetailViewController()
        let interactor = CurrencyDetailInteractor(networkController: self.networkController)
        let wireFrame = CurrencyDetailWireFrame(resolver: self)
        let presenter = CurrencyDetailPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
