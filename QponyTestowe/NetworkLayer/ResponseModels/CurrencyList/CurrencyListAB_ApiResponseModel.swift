//
//  CurrencyABListApiResponseModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct CurrencyListAB_ApiResponseModel: Codable {
    let table: String
    let no: String
    let effectiveDate: String
    let rates: [CurrencyAB_ApiResponseModel]
}
