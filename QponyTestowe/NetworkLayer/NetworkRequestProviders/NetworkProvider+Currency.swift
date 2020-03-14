//
//  NetworkProvider+Currency.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

extension NetworkRequestProvider: NetworkCurrencyRequestProtocol {
   
    func getAB_CurrencyTable(tableType: TableType, completion: @escaping ([ListAB_ApiResponseModel]?, NetworkError?) -> Void) {
        var request: CurrencyListApiRequest!
        
        switch tableType {
        case .a:
            request = .init(tableType: .a)
        case .b:
            request = .init(tableType: .b)
        default:
            return
        }
        
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
                
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                    print(JSONString)
                }
                let jsonModels = try jsonDecoder.decode([ListAB_ApiResponseModel].self, from: data)
                //let models = ListAB_Model.convertArray(apiModels: jsonModels)
                completion(jsonModels, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
    
    func getC_CurrencyTable(completion: @escaping ([ListC_ApiResponseModel]?, NetworkError?) -> Void) {
        let request = CurrencyListApiRequest(tableType: .c)

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
                let model = try jsonDecoder.decode([ListC_ApiResponseModel].self, from: data)
                completion(model, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
}

