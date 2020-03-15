//
//  RatesListAB_Model.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class RatesListAB_Model {
    var table: String = ""
    var currencyName: String = ""
    var currencyCode: String = ""
    var rates: [RateAB_Model] = []
    
    init(table: String, currencyName: String, currencyCode: String, rates: [RateAB_Model]) {
        self.table = table
        self.currencyName = currencyName
        self.currencyCode = currencyCode
        self.rates = rates
    }
    
    static func convert(from model: RateListAB_ApiResponseModel) -> RatesListAB_Model {
        let rates = RateAB_Model.convert(from: model.rates)
        let model = RatesListAB_Model(table: model.table,
                                      currencyName: model.currency,
                                      currencyCode: model.code,
                                 rates: rates)
         return model
     }
    
    static func convertArray(apiModels: [RateListAB_ApiResponseModel]) -> [RatesListAB_Model] {
        return apiModels.compactMap({ RatesListAB_Model.convert(from: $0) })
    }
}
