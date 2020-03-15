//
//  CurrenciesInteractor.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

class CurrenciesInteractor: BaseInteractor { }

extension CurrenciesInteractor: CurrenciesInteractorProtocol {
    func fetchAB_List(tableType: TableType, completion: @escaping ([CurrencyListAB_ApiResponseModel]?, NetworkError?) -> Void) {
        self.networkController.getAB_CurrencyTable(tableType: tableType, completion: completion)
    }
    
    func fetchC_List(completion: @escaping ([CurrencyListC_ApiResponseModel]?, NetworkError?) -> Void) {
        self.networkController.getC_CurrencyTable(completion: completion)
    }
    
}
