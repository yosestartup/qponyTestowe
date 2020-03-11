//
//  ListC_Model.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class ListC_Model {
    var table: String = ""
    var no: String = ""
    var tradingDate: String = ""
    var effectiveDate: String = ""
    var rates: [CurrencyC_Model] = []
    
    init(table: String, no: String, tradingDate: String, effectiveDate: String, rates: [CurrencyC_Model]) {
        self.table = table
        self.no = no
        self.tradingDate = tradingDate
        self.effectiveDate = effectiveDate
        self.rates = rates
    }
    
    static func convert(from model: ListC_ApiResponseModel) -> ListC_Model {
         let rates = CurrencyC_Model.convert(from: model.rates)
         let model = ListC_Model(table: model.table,
                                  no: model.no,
                                  tradingDate: model.tradingDate,
                                  effectiveDate: model.effectiveDate,
                                  rates: rates)
          return model
      }
}
