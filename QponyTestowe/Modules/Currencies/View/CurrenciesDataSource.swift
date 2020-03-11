//
//  CurrenciesDataSource.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

protocol CurrenciesDataSourceDelegate: class {
    func reloadData()
}

class CurrenciesDataSource {
    
    private var currencies = [CurrencyModel]()
    
    weak var delegate: CurrenciesDataSourceDelegate?
    
    func getNumberOfSections() -> Int {
        return 1
    }

    func getNumberOfItems(in section: Int) -> Int {
        return self.currencies.count
    }

    func insertItems(_ items: [CurrencyModel]) {
        self.updateWithItems(items)
    }
    
    func getCell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrenciesTableCell", for: indexPath) as? CurrenciesTableCell else { return UITableViewCell()
        }
        cell.display(self.currencies[indexPath.row])
        return cell
    }
    
    private func updateWithItems(_ items: [CurrencyModel]) {
        self.currencies = items
        DispatchQueue.main.async {
           self.delegate?.reloadData()
       }
    }
}
