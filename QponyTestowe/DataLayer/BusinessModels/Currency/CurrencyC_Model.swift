//
//  CurrencyCModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyC_Model {
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
    
    static func convert(from model: CurrencyC_ApiResponseModel) -> CurrencyC_Model {
        let model = CurrencyC_Model(currency: model.currency,
                                     code: model.code,
                                     bid: model.bid,
                                     ask: model.ask,
                                     effectiveDate: model.effectiveDate,
                                     tradingDate: model.tradingDate)
        return model
    }
    
    static func convert(from items: [CurrencyC_ApiResponseModel]) -> [CurrencyC_Model] {
         var models = [CurrencyC_Model]()
         items.forEach { models.append(CurrencyC_Model.convert(from: $0)) }
         return models
    }
}

