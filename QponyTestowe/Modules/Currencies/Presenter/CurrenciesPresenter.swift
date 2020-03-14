//
//  CurrenciesPresenter.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrenciesPresenter: BasePresenter {

    weak var view: CurrenciesViewProtocol?
    private var wireFrame: CurrenciesWireFrameProtocol
    private var interactor: CurrenciesInteractorProtocol
    private var isLoading: Bool = false

    init(view: CurrenciesViewProtocol, wireFrame: CurrenciesWireFrameProtocol, interactor: CurrenciesInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension CurrenciesPresenter: CurrenciesPresenterProtocol {
    func didRefreshPulled(segment: Int) {
        self.view?.startRefreshing()
        self.fetchDataBySegmentIndex(index: segment)
    }
    
    func viewLoaded(segment: Int) {
        self.view?.showLoading(message: "Ładowanie")
        self.fetchDataBySegmentIndex(index: segment)
    }
    
    func reloadData(segment: Int) {
        self.view?.showLoading(message: "Ładowanie")
        self.fetchDataBySegmentIndex(index: segment)
    }
}

extension CurrenciesPresenter {
    
    private func fetchDataBySegmentIndex(index: Int) {
        switch (index) {
        case 0:
            self.fetchData(tableType: .a)
        case 1:
            self.fetchData(tableType: .b)
        case 2:
            self.fetchData(tableType: .c)
        default:
            self.view?.showOkAlertController(title: "Error", message: "Not yet realized", callback: nil)
        }
    }
    
    private func fetchData(tableType: TableType) {
        
        guard self.isLoading == false else { return }
        
        self.isLoading = true
        
        switch (tableType) {
        case .a:
            self.interactor.fetchAB_List(tableType: .a) { (model, error) in
            defer {
                self.isLoading = false
                DispatchQueue.main.async {
                    self.view?.stopRefreshing()
                    self.view?.hideLoading()
                }
            }
            
            if let error = error {
                DispatchQueue.main.async {
                self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                }
                return
            }
            
            if let model = model {
               let convertedModel = ListAB_Model.convert(from: model[0])
               for currency in convertedModel.rates {
                    currency.effectiveDate = convertedModel.effectiveDate
               }
               self.view?.insert_ABTable_Currencies(models: convertedModel.rates)
               return
            }
            }
        case .b:
            self.interactor.fetchAB_List(tableType: .b) { (model, error) in
            defer {
                self.isLoading = false
                DispatchQueue.main.async {
                    self.view?.stopRefreshing()
                    self.view?.hideLoading()
                }
             }
             
             if let error = error {
                 DispatchQueue.main.async {
                 self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                }
                 return
             }
             
             if let model = model {
                let convertedModel = ListAB_Model.convert(from: model[0])
                for currency in convertedModel.rates {
                     currency.effectiveDate = convertedModel.effectiveDate
                }
                self.view?.insert_ABTable_Currencies(models: convertedModel.rates)
                return
                }
            }
            
        case .c:
            self.interactor.fetchC_List() { (model, error) in
            defer {
                self.isLoading = false
                DispatchQueue.main.async {
                    self.view?.stopRefreshing()
                    self.view?.hideLoading()
                }
             }
             
             if let error = error {
                 DispatchQueue.main.async {
                 self.view?.showOkAlertController(title: "Error", message: error.localizedDescription, callback: nil)
                }
                 return
             }
             
             if let model = model {
                let convertedModel = ListC_Model.convert(from: model[0])
                for currency in convertedModel.rates {
                     currency.effectiveDate = convertedModel.effectiveDate
                     currency.tradingDate = convertedModel.tradingDate
                }
                self.view?.insert_CTable_Currencies(models: convertedModel.rates)
                return
                }
            }
        }
    }
}

