//
//  CurrenciesProtocols.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

enum TableType: String {
    case a = "A"
    case b = "B"
    case c = "C"
}

protocol CurrenciesViewProtocol: class {
    func insert_ABTable_Currencies(models: [CurrencyAB_Model])
    func insert_CTable_Currencies(models: [CurrencyC_Model])
    func startRefreshing()
    func stopRefreshing()
    
    func showLoading(message: String?)
    func hideLoading()
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
}

protocol CurrenciesWireFrameProtocol: class {
}

protocol CurrenciesPresenterProtocol: class {
    func viewLoaded(segment: Int)
    func didRefreshPulled(segment: Int)
    func reloadData(segment: Int)
}

protocol CurrenciesInteractorProtocol: class {
    func fetchAB_List(tableType: TableType, completion: @escaping ([ListAB_ApiResponseModel]?, NetworkError?) -> Void)
    func fetchC_List(completion: @escaping ([ListC_ApiResponseModel]?, NetworkError?) -> Void)
}

