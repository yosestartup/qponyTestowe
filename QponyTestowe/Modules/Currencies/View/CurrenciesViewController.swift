//
//  CurrenciesViewController.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import Foundation

class CurrenciesViewController: BaseViewController {

    var presenter: CurrenciesPresenterProtocol!
    private var segmentedControl: UISegmentedControl!
    private var currenciesTable:UITableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var dataSource: CurrenciesDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }
    
    func createUI() {
        self.navigationController?.isToolbarHidden = true
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Currencies"
        self.view.backgroundColor = UIColor.white
        
        let segments = ["Tabela A", "Tabela B", "Tabela C"]
        self.segmentedControl = UISegmentedControl(items: segments)
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.addTarget(self, action: #selector(changeTable), for: .valueChanged)
        
        self.refreshControl.addTarget(self, action: #selector(refreshDidPulled), for: .valueChanged)
   
        self.dataSource = CurrenciesDataSource()
        self.dataSource.delegate = self
        
        self.currenciesTable.delegate = self
        self.currenciesTable.dataSource = self
        self.currenciesTable.refreshControl = self.refreshControl
        self.currenciesTable.separatorStyle = .none
        self.currenciesTable.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.currenciesTable.register(CurrenciesTableCell.self, forCellReuseIdentifier: "CurrenciesTableCell")
        
        self.view.addSubview(self.segmentedControl)
        self.view.addSubview(self.currenciesTable)
        
        self.segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5.withRatio())
            make.left.equalToSuperview().offset(20.withRatio())
            make.right.equalToSuperview().offset(-20.withRatio())
            make.centerX.equalToSuperview()
        }
        
        self.currenciesTable.snp.makeConstraints { (make) in
            make.top.equalTo(self.segmentedControl.snp.bottom).offset(5.withRatio())
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc private func changeTable(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("A")
        case 1:
            print("B")
        case 2:
            print("C")
        default:
            print("Fail")
        }
    }
    
    @objc private func refreshDidPulled(sender: UIRefreshControl) {
       self.presenter.reloadData()
    }
}

extension CurrenciesViewController: CurrenciesViewProtocol {
    func insertCurrencies(models: [CurrencyABModel]) {
       self.dataSource.insertItems(models)
    }
    
    func startLoading() {
       if !self.refreshControl.isRefreshing {
           self.refreshControl.beginRefreshing()
       }
    }

    func stopLoading() {
       if self.refreshControl.isRefreshing {
            self.refreshControl.endRefreshing()
        }
    }
}

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.withRatio()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.getNumberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.dataSource.getCell(for: tableView, indexPath: indexPath)
    }
    
}

extension CurrenciesViewController: CurrenciesDataSourceDelegate {
    func reloadData() {
        self.currenciesTable.reloadData()
    }
}



