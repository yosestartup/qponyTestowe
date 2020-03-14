//
//  Cuure.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 13/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct CurrencyListApiRequest: NetworkRequest {
    
    var tableType: TableType
    
    var path: String { return "/exchangerates/tables/\(tableType.rawValue)/?format=json" }
    
    var method: RequestHTTPMethod {
        return .get
    }
    
    var params: [String: Any] {
        return [:]
    }
    
}
