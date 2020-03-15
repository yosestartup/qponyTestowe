//
//  CurrencyDetailViewController.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

enum TextFieldType {
    case from
    case to
}

class CurrencyDetailViewController: BaseViewController {

    var presenter: CurrencyDetailPresenterProtocol!
    private let fromDateLabel = UILabel()
    private let fromDateTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let toLabel = UILabel()
    private let toDateTextField = UITextField()
    private let searchButton = UIButton()
    private let refreshControl = UIRefreshControl()
    private let tableView = UITableView()
    private var dataSource: CurrencyDetailDataSource!
    
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
        
        self.refreshControl.addTarget(self, action: #selector(refreshDidPulled), for: .valueChanged)
        
        self.dataSource = CurrencyDetailDataSource()
        self.dataSource.delegate = self
        
        self.view.addSubview(self.fromDateLabel)
        self.view.addSubview(self.toLabel)
        self.view.addSubview(self.fromDateTextField)
        self.view.addSubview(self.toDateTextField)
        self.view.addSubview(self.searchButton)
        self.view.addSubview(self.tableView)
        
        self.fromDateLabel.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.fromDateLabel.text = "Od: "
        self.fromDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(11.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
        }
        
        self.fromDateTextField.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.fromDateTextField.tintColor = UIColor.clear
        self.fromDateTextField.text = "wybierz datę >"
        self.fromDateTextField.textColor = ColorManager.standardBlue
        self.datePicker.datePickerMode = .date
        self.datePicker.maximumDate = Date()
        self.datePicker.minimumDate = Date("2002-01-02")
        self.fromDateTextField.inputAccessoryView = getDateToolbar(sender: self.fromDateTextField)
        self.fromDateTextField.inputView = self.datePicker
        self.fromDateTextField.delegate = self
        self.fromDateTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.fromDateLabel.snp.top)
            make.left.equalTo(self.fromDateLabel.snp.right)
        }
        
        self.toLabel.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.toLabel.text = "Do: "
        self.toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.fromDateLabel.snp.bottom).offset(7.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
        }

        self.toDateTextField.font = UIFont.systemFont(ofSize: 20.withRatio(), weight: .regular)
        self.toDateTextField.tintColor = UIColor.clear
        self.toDateTextField.text = "wybierz datę >"
        self.toDateTextField.textColor = ColorManager.standardBlue
        self.datePicker.datePickerMode = .date
        self.toDateTextField.inputAccessoryView = getDateToolbar(sender: self.toDateTextField)
        self.toDateTextField.inputView = self.datePicker
        self.toDateTextField.delegate = self
        self.toDateTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.toLabel.snp.top)
            make.left.equalTo(self.toLabel.snp.right)
        }
        
        self.searchButton.backgroundColor = ColorManager.standardBlue
        self.searchButton.setTitle("Szukaj", for: .normal)
        self.searchButton.layer.cornerRadius = 8.withRatio()
        self.searchButton.addTarget(self, action: #selector(didClickSearchButton), for: .touchUpInside)
        self.searchButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.toLabel.snp.bottom).offset(14.withRatio())
            make.left.equalToSuperview().offset(16.withRatio())
            make.right.equalToSuperview().offset(-16.withRatio())
            make.height.equalTo(40.withRatio())
        }
        
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.refreshControl = self.refreshControl
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.tableView.register(CurrencyDetailAB_TableCell.self, forCellReuseIdentifier: "CurrencyDetail_ABTableCell")
        self.tableView.register(CurrencyDetailC_TableCell.self, forCellReuseIdentifier: "CurrencyDetail_CTableCell")
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchButton.snp.bottom).offset(5.withRatio())
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func getDateToolbar(sender: UITextField) -> UIToolbar {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        var doneButton = UIBarButtonItem()
        if(sender == self.fromDateTextField) {
            doneButton = UIBarButtonItem(title: "Done", style: .bordered, target: self, action: #selector(doneFromTextField))
        } else {
            doneButton = UIBarButtonItem(title: "Done", style: .bordered, target: self, action: #selector(doneToTextField))
        }
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .bordered, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        return toolbar
    }
    
    @objc private func didClickSearchButton() {
        self.presenter.didClickSearchButton()
    }
    
    @objc private func doneFromTextField() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.fromDateTextField.text = formatter.string(from: self.datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc private func doneToTextField() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.toDateTextField.text = formatter.string(from: self.datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc private func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    @objc private func refreshDidPulled(sender: UIRefreshControl) {
        self.presenter.didRefreshPulled()
    }
}

extension CurrencyDetailViewController: UITextFieldDelegate {
   
}

extension CurrencyDetailViewController: CurrencyDetailViewProtocol {
    func getFromDate() -> String {
        return self.fromDateTextField.text ?? ""
    }
    
    func getToDate() -> String {
        return self.toDateTextField.text ?? ""
    }
    
    func insert_ABTable(rates: [RateAB_Model]) {
        if let tableType = rates[0].tableType {
            self.dataSource.changeDataSourceType(tableType)
            self.dataSource.insertABItems(rates)
        }
    }
    
    func insert_CTable(rates: [RateC_Model]) {
        self.dataSource.changeDataSourceType(.c)
        self.dataSource.insertCItems(rates)
    }
    
    func startRefreshing() {
        if !self.refreshControl.isRefreshing {
            self.refreshControl.beginRefreshing()
        }
    }
    
    func stopRefreshing() {
        if self.refreshControl.isRefreshing {
             self.refreshControl.endRefreshing()
        }
    }
    
    func setTitle(text: String) {
        self.title = text
    }
}

extension CurrencyDetailViewController: UITableViewDelegate, UITableViewDataSource {
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

extension CurrencyDetailViewController: CurrencyDetailDataSourceDelegate {
    func reloadData() {
        self.tableView.reloadData()
    }
}
