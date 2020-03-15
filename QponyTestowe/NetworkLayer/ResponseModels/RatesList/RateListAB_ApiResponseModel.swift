//
//  RatesABList_ApiResponseModel.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct RateListAB_ApiResponseModel: Codable {
    let table: String
    let currency: String
    let code: String
    let rates: [RateAB_ApiResponseModel]
}
