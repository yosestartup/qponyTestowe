//
//  CurrencyDetailDataSource.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol CurrencyDetailDataSourceDelegate: class {
    func reloadData()
}

class CurrencyDetailDataSource {
    
    private var dataSourceType: TableType? = TableType(rawValue: "a")
    private var AB_rates = [RateAB_Model]()
    private var C_rates = [RateC_Model]()
    
    weak var delegate: CurrencyDetailDataSourceDelegate?
    
    func changeDataSourceType(_ type: TableType) {
        self.dataSourceType = type
    }
        
    func getNumberOfSections() -> Int {
        return 1
    }

    func getNumberOfItems(in section: Int) -> Int {
        switch (dataSourceType) {
          case .a:
            return self.AB_rates.count
          case .b:
            return self.AB_rates.count
          case .c:
            return self.C_rates.count
         default:
            return 0
        }
    }

    func insertABItems(_ items: [RateAB_Model]) {
        self.updateWith_ABItems(items)
    }
    
    func insertCItems(_ items: [RateC_Model]) {
        self.updateWith_CItems(items)
    }
    
    func getCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch (dataSourceType) {
            case .a:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyDetail_ABTableCell", for: indexPath) as? CurrencyDetail_ABTableCell else { return UITableViewCell() }
                cell.display(self.AB_rates[indexPath.row])
                return cell
            case .b:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyDetail_ABTableCell", for: indexPath) as? CurrencyDetail_ABTableCell else { return UITableViewCell() }
                cell.display(self.AB_rates[indexPath.row])
                return cell
            case .c:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyDetail_CTableCell", for: indexPath) as? CurrencyDetail_CTableCell else { return UITableViewCell() }
                cell.display(self.C_rates[indexPath.row])
                return cell
            default:
                return UITableViewCell()
        }
    }

    private func updateWith_ABItems(_ items: [RateAB_Model]) {
        self.AB_rates = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
    
    private func updateWith_CItems(_ items: [RateC_Model]) {
        self.C_rates = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
}
