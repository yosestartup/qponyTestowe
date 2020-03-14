//
//  CurrencyModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyAB_Model: CurrencyBaseModel {
    var mid: Float = 0.0
    var effectiveDate: String = ""
    
    init(currency: String, code: String, mid: Float, effectiveDate: String) {
        super.init()
        self.currency = currency
        self.code = code
        self.mid = mid
        self.effectiveDate = effectiveDate
    }
    
    static func convert(from model: CurrencyAB_ApiResponseModel) -> CurrencyAB_Model {
        let model = CurrencyAB_Model(currency: model.currency,
                                     code: model.code,
                                     mid: model.mid,
                                     effectiveDate: "")
        return model
    }
    
    static func convert(from items: [CurrencyAB_ApiResponseModel]) -> [CurrencyAB_Model] {
         var models = [CurrencyAB_Model]()
         items.forEach { models.append(CurrencyAB_Model.convert(from: $0)) }
         return models
    }
}
