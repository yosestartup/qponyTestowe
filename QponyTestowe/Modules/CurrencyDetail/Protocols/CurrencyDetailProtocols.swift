//
//  CurrencyDetailProtocols.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol CurrencyDetailViewProtocol: class {
    func setTitle(text: String)
    func startRefreshing()
    func stopRefreshing()
    func showLoading(message: String?)
    func hideLoading()
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
    func insert_ABTable(rates: [RateAB_Model])
    func insert_CTable(rates: [RateC_Model])
    func getFromDate() -> String
    func getToDate() -> String
}

protocol CurrencyDetailWireFrameProtocol: class { }

protocol CurrencyDetailPresenterProtocol: class {
    func didClickSearchButton()
    func reloadData()
    func didRefreshPulled()
    func viewLoaded()
}

protocol CurrencyDetailInteractorProtocol: class {
    func fetchAB_RatesList(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListAB_ApiResponseModel?, NetworkError?) -> Void)
    func fetchC_RatesList(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListC_ApiResponseModel?, NetworkError?) -> Void)
}

