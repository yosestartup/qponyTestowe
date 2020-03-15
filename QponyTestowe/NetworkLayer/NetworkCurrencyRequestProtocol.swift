//
//  NetworkAccountRequestProtocol.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

protocol NetworkCurrencyRequestProtocol {
    func getAB_CurrencyTable(tableType: TableType, completion: @escaping([CurrencyListAB_ApiResponseModel]?, NetworkError?) -> Void)
    func getC_CurrencyTable(completion: @escaping([CurrencyListC_ApiResponseModel]?, NetworkError?) -> Void)
}
