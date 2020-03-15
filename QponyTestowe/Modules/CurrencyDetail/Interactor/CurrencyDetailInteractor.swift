//
//  CurrencyDetailInteractor.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

class CurrencyDetailInteractor: BaseInteractor { }

extension CurrencyDetailInteractor: CurrencyDetailInteractorProtocol {
    func fetchAB_RatesList(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListAB_ApiResponseModel?, NetworkError?) -> Void) {
        self.networkController.getAB_RatesTable(tableType: tableType, currencyCode: currencyCode, startDate: startDate, endDate: endDate, completion: completion)
    }
    
    func fetchC_RatesList(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListC_ApiResponseModel?, NetworkError?) -> Void) {
        self.networkController.getC_RatesTable(tableType: tableType, currencyCode: currencyCode, startDate: startDate, endDate: endDate, completion: completion)
    }
}
