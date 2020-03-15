//
//  RatesListApiRequest.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct RatesListApiRequest: NetworkRequest {
    
    var tableType: TableType
    var currencyCode: String
    var startDate: String
    var endDate: String
    
    var path: String { return "/exchangerates/rates/\(tableType.rawValue)/\(currencyCode)/\(startDate)/\(endDate)/?format=json" }
    
    var method: RequestHTTPMethod {
        return .get
    }
    
    var params: [String: Any] {
        return [:]
    }
    
}
