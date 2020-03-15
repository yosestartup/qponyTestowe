//
//  Rate_ABModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class RateAB_Model: RateBaseModel {
    var mid: Double = 0.0

    init(mid: Double, tabelNumber: String, effectiveDate: String) {
        super.init()
        self.mid = mid
        self.tabelNumber = tabelNumber
        self.effectiveDate = effectiveDate
    }
    
    static func convert(from model: RateAB_ApiResponseModel) -> RateAB_Model {
        let model = RateAB_Model(mid: model.mid,
                                 tabelNumber: model.no,
                                 effectiveDate: model.effectiveDate)
        return model
    }

    static func convert(from items: [RateAB_ApiResponseModel]) -> [RateAB_Model] {
         var models = [RateAB_Model]()
         items.forEach { models.append(RateAB_Model.convert(from: $0)) }
         return models
    }
}
