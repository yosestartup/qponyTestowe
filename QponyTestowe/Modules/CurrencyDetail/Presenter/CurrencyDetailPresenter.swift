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

extension CurrencyDetailPresenter: CurrencyDetailPresenterProtocol { }
