//
//  CurrencyCModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyC_Model: CurrencyBaseModel {
    var bid: Double = 0.0
    var ask: Double = 0.0
    var effectiveDate: String = ""
    var tradingDate: String = ""
    
    init(currency: String, code: String, bid: Double, ask: Double, effectiveDate: String, tradingDate: String) {
        super.init()
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
                                     effectiveDate: "",
                                     tradingDate: "")
        return model
    }
    
    static func convert(from items: [CurrencyC_ApiResponseModel]) -> [CurrencyC_Model] {
         var models = [CurrencyC_Model]()
         items.forEach { models.append(CurrencyC_Model.convert(from: $0)) }
         return models
    }
}

