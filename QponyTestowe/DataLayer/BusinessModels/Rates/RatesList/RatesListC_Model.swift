//
//  RatesListC_Model.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class RatesListC_Model {
    var table: String = ""
    var currencyName: String = ""
    var currencyCode: String = ""
    var rates: [RateC_Model] = []
    
    init(table: String, currencyName: String, currencyCode: String, rates: [RateC_Model]) {
        self.table = table
        self.currencyName = currencyName
        self.currencyCode = currencyCode
        self.rates = rates
    }
    
    static func convert(from model: RateListC_ApiResponseModel) -> RatesListC_Model {
        let rates = RateC_Model.convert(from: model.rates)
        let model = RatesListC_Model(table: model.table,
                                      currencyName: model.currency,
                                      currencyCode: model.code,
                                 rates: rates)
         return model
     }
    
    static func convertArray(apiModels: [RateListC_ApiResponseModel]) -> [RatesListC_Model] {
        return apiModels.compactMap({ RatesListC_Model.convert(from: $0) })
    }
}
