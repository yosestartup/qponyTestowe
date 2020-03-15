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
}

protocol CurrencyDetailWireFrameProtocol: class { }

protocol CurrencyDetailPresenterProtocol: class {
    func viewLoaded()
}

protocol CurrencyDetailInteractorProtocol: class { }

