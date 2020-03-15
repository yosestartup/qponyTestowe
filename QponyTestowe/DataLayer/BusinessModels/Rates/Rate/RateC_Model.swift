//
//  RateC_Model.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class RateC_Model: RateBaseModel {
    var bid: Double = 0.0
    var ask: Double = 0.0

    init(bid: Double, ask: Double, tabelNumber: String, effectiveDate: String) {
       super.init()
       self.bid = bid
       self.ask = ask
       self.tabelNumber = tabelNumber
       self.effectiveDate = effectiveDate
   }
    
    static func convert(from model: RateC_ApiResponseModel) -> RateC_Model {
        let model = RateC_Model(bid: model.bid,
                                ask: model.ask,
                                tabelNumber: model.no,
                                effectiveDate: model.effectiveDate)
        return model
    }

    static func convert(from items: [RateC_ApiResponseModel]) -> [RateC_Model] {
         var models = [RateC_Model]()
         items.forEach { models.append(RateC_Model.convert(from: $0)) }
         return models
    }
    
}
