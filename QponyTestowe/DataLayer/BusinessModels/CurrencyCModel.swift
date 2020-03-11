//
//  CurrencyCModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyCModel {
    var currency: String = ""
    var code: String = ""
    var bid: Float = 0.0
    var ask: Float = 0.0
    var effectiveDate: String = ""
    var tradingDate: String = ""
    
    init(currency: String, code: String, bid: Float, ask: Float, effectiveDate: String, tradingDate: String) {
        self.currency = currency
        self.code = code
        self.bid = bid
        self.ask = ask
        self.effectiveDate = effectiveDate
        self.tradingDate = tradingDate
    }
}

