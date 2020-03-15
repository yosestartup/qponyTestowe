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
    private let fromDateLabel = UILabel()
    private let toLabel = UILabel()
    private let fromDateTextField = UITextField()
    private let toTextField = UITextField()
    private let searchButton = UIButton()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.viewLoaded()
    }


    private func createUI() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "HelveticaNeue-Bold", size: 24.withRatio())!]
        
        self.title = "Currency detail"
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.fromDateLabel)
        self.view.addSubview(self.toLabel)
        self.view.addSubview(self.fromDateTextField)
        self.view.addSubview(self.toTextField)
        self.view.addSubview(self.searchButton)
        self.view.addSubview(self.tableView)
        
        self.fromDateLabel.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.fromDateLabel.text = "Od: "
        self.fromDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(11.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
        }
        
        self.fromDateTextField.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.fromDateTextField.text = "wybierz datę >"
        self.fromDateTextField.textColor = ColorManager.standardBlue
        self.fromDateTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.fromDateLabel.snp.top)
            make.left.equalTo(self.fromDateLabel.snp.right)
        }
        
        self.toLabel.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.toLabel.text = "Do: "
        self.toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.fromDateLabel.snp.bottom).offset(10.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
        }

        self.toTextField.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.toTextField.text = "wybierz datę >"
        self.toTextField.textColor = ColorManager.standardBlue
        self.toTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.toLabel.snp.top)
            make.left.equalTo(self.toLabel.snp.right)
        }
        
        self.searchButton.backgroundColor = ColorManager.standardBlue
        self.searchButton.setTitle("Szukaj", for: .normal)
        self.searchButton.layer.cornerRadius = 8.withRatio()
        self.searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.toLabel.snp.bottom).offset(14.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
            make.right.equalToSuperview().offset(-16.withRatio())
            make.height.equalTo(40.withRatio())
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchButton.snp.bottom).offset(5.withRatio())
            make.left.right.bottom.equalToSuperview()
        }
        
        
        
        
        
        
    }
}
extension CurrencyDetailViewController: CurrencyDetailViewProtocol {
    func setTitle(text: String) {
        self.title = text
    }
}
