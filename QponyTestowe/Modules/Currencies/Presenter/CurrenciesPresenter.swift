//
//  CurrenciesPresenter.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

class CurrenciesPresenter: BasePresenter {

    weak var view: CurrenciesViewProtocol?
    private var wireFrame: CurrenciesWireFrameProtocol
    private var interactor: CurrenciesInteractorProtocol

    init(view: CurrenciesViewProtocol, wireFrame: CurrenciesWireFrameProtocol, interactor: CurrenciesInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
}

extension CurrenciesPresenter: CurrenciesPresenterProtocol {

}
