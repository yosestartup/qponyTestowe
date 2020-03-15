//
//  CurrenciesWireFrame.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class CurrenciesWireFrame: BaseWireFrame, CurrenciesWireFrameProtocol {
    func presentCurrencyDetailDetail(from view: CurrenciesViewProtocol?, currencyModel: CurrencyBaseModel) {
        guard let fromView = view as? UIViewController else { return }
        let viewController = self.resolver.presentCurrencyDetailViewController(currencyModel: currencyModel)
        fromView.navigationController?.pushViewController(viewController, animated: true)
    }
}
