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
    
    func reloadData() {
        self.fetchData()
    }

}

extension CurrenciesPresenter {
    private func fetchData() {
        
        guard self.isLoading == false else { return }

        self.view?.startLoading()
        self.isLoading = true
        
        
        let rand = CurrencyAB_Model(currency: "rand (Republika Południowej Afryki)", code: "RND", mid: 0.012859, effectiveDate: "2020-03-10")
        let dolar = CurrencyAB_Model(currency: "dolar samoański", code: "USD", mid: 4.9, effectiveDate: "2020-03-10")
        let aud = CurrencyAB_Model(currency: "dolar australijski", code: "AUD", mid: 2.5020, effectiveDate: "2020-03-10")
        let nz = CurrencyAB_Model(currency: "dolar nowozelandzki", code: "NZD", mid: 4.9, effectiveDate: "2020-03-10")
        
        let models = [rand, dolar, nz, aud]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           defer {
                self.isLoading = false
                self.view?.stopLoading()
           }
           self.view?.insertCurrencies(models: models)
        }

      
              
    }
}

