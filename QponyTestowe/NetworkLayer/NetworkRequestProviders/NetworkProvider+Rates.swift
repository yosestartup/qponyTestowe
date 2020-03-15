//
//  NetworkProvider+Rates.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

extension NetworkRequestProvider: NetworkRatesRequestProtocol {
    func getAB_RatesTable(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListAB_ApiResponseModel?, NetworkError?) -> Void) {
        
        var request: RatesListApiRequest = RatesListApiRequest(tableType: tableType, currencyCode: currencyCode, startDate: startDate, endDate: endDate)
        
        self.runRequest(request) { (_, data, error) in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let error = NetworkErrorStruct(statusCode: nil, data: nil)
                    completion(nil, error)
                    return
                }
            do {
                
                let jsonModels = try jsonDecoder.decode(RateListAB_ApiResponseModel.self, from: data)
                completion(jsonModels, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
    
    func getC_RatesTable(tableType: TableType, currencyCode: String, startDate: String, endDate: String, completion: @escaping (RateListC_ApiResponseModel?, NetworkError?) -> Void) {
        var request: RatesListApiRequest = RatesListApiRequest(tableType: tableType, currencyCode: currencyCode, startDate: startDate, endDate: endDate)
        
        self.runRequest(request) { (_, data, error) in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let error = NetworkErrorStruct(statusCode: nil, data: nil)
                    completion(nil, error)
                    return
                }
            do {
                
                let jsonModels = try jsonDecoder.decode(RateListC_ApiResponseModel.self, from: data)
                completion(jsonModels, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
    
}
