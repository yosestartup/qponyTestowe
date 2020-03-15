//
//  CurrencyDetailProtocols.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol CurrencyDetailViewProtocol: class {
    func setTitle(text: String)
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
}

protocol CurrencyDetailWireFrameProtocol: class { }

protocol CurrencyDetailPresenterProtocol: class {
    func didClickSearchButton(from: String, to: String)
    func viewLoaded()
}

protocol CurrencyDetailInteractorProtocol: class { }

