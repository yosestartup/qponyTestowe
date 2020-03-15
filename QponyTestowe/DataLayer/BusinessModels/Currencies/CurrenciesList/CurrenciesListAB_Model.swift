//
//  ListAB_Model.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrenciesListAB_Model {
    var table: String = ""
    var no: String = ""
    var effectiveDate: String = ""
    var rates: [CurrencyAB_Model] = []
    
    init(table: String, no: String, effectiveDate: String, rates: [CurrencyAB_Model]) {
        self.table = table
        self.no = no
        self.effectiveDate = effectiveDate
        self.rates = rates
    }
    
    static func convert(from model: CurrencyListAB_ApiResponseModel) -> CurrenciesListAB_Model {
        let rates = CurrencyAB_Model.convert(from: model.rates)
        let model = CurrenciesListAB_Model(table: model.table,
                                 no: model.no,
                                 effectiveDate: model.effectiveDate,
                                 rates: rates)
         return model
     }
    
    static func convertArray(apiModels: [CurrencyListAB_ApiResponseModel]) -> [CurrenciesListAB_Model] {
        return apiModels.compactMap({ CurrenciesListAB_Model.convert(from: $0) })
    }
}
