//
//  CurrencyDetailPresenter.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

class CurrencyDetailPresenter: BasePresenter {

    weak var view: CurrencyDetailViewProtocol?
    private var wireFrame: CurrencyDetailWireFrameProtocol
    private var interactor: CurrencyDetailInteractorProtocol
    private var currencyModel: CurrencyBaseModel!
    private var currencyTableType: TableType!
    
    init(currencyModel: CurrencyBaseModel, view: CurrencyDetailViewProtocol, wireFrame: CurrencyDetailWireFrameProtocol, interactor: CurrencyDetailInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
        self.currencyModel = currencyModel
        self.currencyTableType = currencyModel.tableType
    }
}

extension CurrencyDetailPresenter: CurrencyDetailPresenterProtocol {
    
    func didClickSearchButton(from: String, to: String) {
        if(from.isEmpty || to.isEmpty) {
            self.view?.showOkAlertController(title: "Błąd", message: "Jedna albo dwie daty są niepoprawne", callback: nil)
            return
        }
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
}
