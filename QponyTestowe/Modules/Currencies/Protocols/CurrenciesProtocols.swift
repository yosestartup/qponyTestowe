//
//  CurrenciesProtocols.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol CurrenciesViewProtocol: class {
    func insertCurrencies(models: [CurrencyAB_Model])
    func startLoading()
    func stopLoading()
}

protocol CurrenciesWireFrameProtocol: class {
}

protocol CurrenciesPresenterProtocol: class {
    func reloadData()
}

protocol CurrenciesInteractorProtocol: class {
}

