//
//  CurrencyDetailViewController.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class CurrencyDetailViewController: BaseViewController {

    var presenter: CurrencyDetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()

    }


    private func createUI() {

    }
}
extension CurrencyDetailViewController: CurrencyDetailViewProtocol { }
