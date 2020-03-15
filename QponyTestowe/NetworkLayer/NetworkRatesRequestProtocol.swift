//
//  File.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

protocol NetworkRatesRequestProtocol {
    func getAB_RatesTable(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping(RateListAB_ApiResponseModel?, NetworkError?) -> Void)
    func getC_RatesTable(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping(RateListC_ApiResponseModel?, NetworkError?) -> Void)
}
