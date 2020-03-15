//
//  CurrencyDetailPresenter.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class CurrencyDetailPresenter: BasePresenter {

    weak var view: CurrencyDetailViewProtocol?
    private var wireFrame: CurrencyDetailWireFrameProtocol
    private var interactor: CurrencyDetailInteractorProtocol
    private var currencyModel: CurrencyBaseModel!
    private var currencyTableType: TableType!
    private var isLoading: Bool = false
    
    init(currencyModel: CurrencyBaseModel, view: CurrencyDetailViewProtocol, wireFrame: CurrencyDetailWireFrameProtocol, interactor: CurrencyDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.currencyModel = currencyModel
        self.currencyTableType = currencyModel.tableType
    }
}

extension CurrencyDetailPresenter {
    
    private func fetchData(from: String, to: String) {
        guard self.isLoading == false else { return }
        
        self.isLoading = true
    
        switch (currencyTableType) {
        case .a:
        self.interactor.fetchAB_RatesList(tableType: self.currencyTableType, currencyCode: self.currencyModel.code, startDate: from, endDate: to) { (model, error) in
               
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
              let convertedModel = RatesListAB_Model.convert(from: model)
              for rate in convertedModel.rates {
                   rate.tableType = .a
            }
                self.view?.insert_ABTable(rates: convertedModel.rates)
                return
           }
        }
            
        case .b:
        self.interactor.fetchAB_RatesList(tableType: self.currencyTableType, currencyCode: self.currencyModel.code, startDate: from, endDate: to) { (model, error) in
               
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
              let convertedModel = RatesListAB_Model.convert(from: model)
              for rate in convertedModel.rates {
                   rate.tableType = .b
            }
                self.view?.insert_ABTable(rates: convertedModel.rates)
                return
           }
        }
        case .c:
        self.interactor.fetchC_RatesList(tableType: self.currencyTableType, currencyCode: self.currencyModel.code, startDate: from, endDate: to) { (model, error) in
               
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
              let convertedModel = RatesListC_Model.convert(from: model)
              for rate in convertedModel.rates {
                   rate.tableType = .c
            }
                self.view?.insert_CTable(rates: convertedModel.rates)
                return
           }
        }
        case .none:
            break
        }
}
    
    private func validateDatesAndLoadData() {
        let charset = CharacterSet(charactersIn: "wybierz")
        
        if let fromDateText = self.view?.getFromDate(), let toDateText = self.view?.getToDate() {
            if(fromDateText.isEmpty || toDateText.isEmpty || fromDateText.rangeOfCharacter(from: charset) != nil || toDateText.rangeOfCharacter(from: charset) != nil) {
                self.view?.hideLoading()
                self.view?.stopRefreshing()
                self.view?.showOkAlertController(title: "Błąd", message: "Jedna albo dwie daty są niepoprawne", callback: nil)
            return
        } else {
            let fromDate = Date(fromDateText ?? "")
            let toDate = Date(toDateText ?? "")
            if(toDate<fromDate) {
                self.view?.hideLoading()
                self.view?.stopRefreshing()
                self.view?.showOkAlertController(title: "Błąd", message: "Data początkowa nie może być większa od końcowej", callback: nil)
            return
            }
        }
            
        self.fetchData(from: fromDateText, to: toDateText)
        }
    }
}

extension CurrencyDetailPresenter: CurrencyDetailPresenterProtocol {
    func didRefreshPulled() {
        self.view?.startRefreshing()
        self.validateDatesAndLoadData()
    }
    
    
    func didClickSearchButton() {
        self.reloadData()
    }
    
    func viewLoaded() {
        let currencyName = currencyModel.currency
        if let index = currencyName.range(of: "(")?.lowerBound {
            let substring = currencyName[..<index]
            let cuttedName = String(substring)
            self.view?.setTitle(text: cuttedName)
            return
        }
        self.view?.setTitle(text: currencyName)
    }
    
    func reloadData() {
        self.view?.showLoading(message: "Ładowanie")
        self.validateDatesAndLoadData()
    }
    
}

