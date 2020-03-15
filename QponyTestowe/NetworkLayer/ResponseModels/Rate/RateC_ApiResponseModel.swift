//
//  RateC_ApiResponseModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct RateC_ApiResponseModel: Codable {
    let no: String
    let effectiveDate: String
    let bid: Double
    let ask: Double
}
