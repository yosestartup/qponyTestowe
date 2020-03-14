//
//  Currencies_ABTable_DataSorce.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

enum DataSourceType: CaseIterable {
    case ab
    case c
    
    init?(caseName: String) {
      for value in DataSourceType.allCases where "\(value)" == caseName {
          self = value
          return
      }

      return nil
    }
}
protocol CurrenciesDataSourceDelegate: class {
    func reloadData()
}

class CurrenciesDataSource {

    private var dataSourceType: DataSourceType? = DataSourceType(caseName: "ab")
    private var AB_currencies = [CurrencyAB_Model]()
    private var C_currencies = [CurrencyC_Model]()
    
    weak var delegate: CurrenciesDataSourceDelegate?
    
    func changeDataSourceType(_ type: DataSourceType) {
        self.dataSourceType = type
    }
    
    func getNumberOfSections() -> Int {
        return 1
    }

    func getNumberOfItems(in section: Int) -> Int {
        switch (dataSourceType) {
          case .ab:
            return self.AB_currencies.count
          case .c:
            return self.C_currencies.count
         default:
            return 0
        }
        
    }

    func insertABItems(_ items: [CurrencyAB_Model]) {
        self.updateWith_ABItems(items)
    }
    
    func insertCItems(_ items: [CurrencyC_Model]) {
        self.updateWith_CItems(items)
    }
    
    func getCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch (dataSourceType) {
            case .ab:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyABTableCell", for: indexPath) as? CurrencyABTableCell else { return UITableViewCell() }
                cell.display(self.AB_currencies[indexPath.row])
                return cell
            case .c:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCTableCell", for: indexPath) as? CurrencyCTableCell else { return UITableViewCell() }
                cell.display(self.C_currencies[indexPath.row])
                return cell
            default:
                return UITableViewCell()
        }
    }
    
    private func updateWith_ABItems(_ items: [CurrencyAB_Model]) {
        self.AB_currencies = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
    
    private func updateWith_CItems(_ items: [CurrencyC_Model]) {
        self.C_currencies = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
}
