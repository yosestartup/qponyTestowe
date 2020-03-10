//
//  NetworkRequest.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/10/2019.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

enum RequestHTTPMethod {
    case get
}

protocol NetworkRequest {
    var path: String { get }
    var method: RequestHTTPMethod { get }
    var params: [String: Any] { get }
}

