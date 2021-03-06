//
//  CurrencyC_ApiResponseModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct CurrencyC_ApiResponseModel: Codable {
    var currency: String
    var code: String
    var bid: Double
    var ask: Double
}
