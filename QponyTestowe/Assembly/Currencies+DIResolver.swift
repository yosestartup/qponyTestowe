//
//  Currencies+DIResolver.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - CurrenciesProtocol
protocol CurrenciesProtocol {
    func presentCurrenciesViewController() -> UIViewController
}

extension DIResolver: CurrenciesProtocol {
    func presentCurrenciesViewController() -> UIViewController {
        let viewController = CurrenciesViewController()
        let interactor = CurrenciesInteractor(networkController: self.networkController)
        let wireFrame = CurrenciesWireFrame(resolver: self)
        let presenter = CurrenciesPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
