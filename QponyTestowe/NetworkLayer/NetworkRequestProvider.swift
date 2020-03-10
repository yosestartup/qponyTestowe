//
//  NetworkRequestProvider.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class NetworkRequestProvider {

    let networkWrapper: NetworkRequestWrapperProtocol

    init(networkWrapper: NetworkRequestWrapperProtocol) {
        self.networkWrapper = networkWrapper
    }

    internal func runRequest(_ request: NetworkRequest, completion: @escaping(_ statusCode: Int, _ requestData: Data?, _ error: NetworkError?) -> Void) {

        
        self.networkWrapper.runRequest(request) { [weak self] (statusCode, data, error) in
            guard let s = self else { return }

            guard let error = error else {
                completion(statusCode, data, nil)
                return
            }

            switch error.type {
            default:
                completion(statusCode, nil, error)
            }
        }
    }
}
