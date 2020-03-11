//
//  CurrencyModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyABModel {
    var currency: String = ""
    var code: String = ""
    var mid: Float = 0.0
    var effectiveDate: String = ""
    
    init(currency: String, code: String, mid: Float, effectiveDate: String) {
        self.currency = currency
        self.code = code
        self.mid = mid
        self.effectiveDate = effectiveDate
    }
}
