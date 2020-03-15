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
    
    private func fetchData() {
        guard self.isLoading == false else { return }
        
        self.isLoading = true
    
            
        //self.view?.insert_ABTable(rates: [rateABModel1, rateABModel2])
    }
    
    private func isDatesValid() -> Bool {
        let fromDateText = self.view?.getFromDate()
        let toDateText = self.view?.getToDate()
        let charset = CharacterSet(charactersIn: "wybierz")
        
        if(fromDateText?.isEmpty ?? true || toDateText?.isEmpty ?? true || fromDateText?.rangeOfCharacter(from: charset) != nil || toDateText?.rangeOfCharacter(from: charset) != nil) {
                self.view?.hideLoading()
                self.view?.stopRefreshing()
                self.view?.showOkAlertController(title: "Błąd", message: "Jedna albo dwie daty są niepoprawne", callback: nil)
            return false
        } else {
            let fromDate = Date(fromDateText ?? "")
            let toDate = Date(toDateText ?? "")
            if(toDate<fromDate) {
                self.view?.hideLoading()
                self.view?.stopRefreshing()
                self.view?.showOkAlertController(title: "Błąd", message: "Data początkowa nie może być większa od końcowej", callback: nil)
            return false
            }
        }
        return true
    }
}

extension CurrencyDetailPresenter: CurrencyDetailPresenterProtocol {
    func didRefreshPulled() {
        self.view?.startRefreshing()
        if(isDatesValid()){
            self.fetchData()
        }
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
        if(isDatesValid()){
            self.fetchData()
        }
    }
    
}

