//
//  NetworkProvider+Currency.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

extension NetworkRequestProvider: NetworkCurrencyRequestProtocol {
   
    func getAB_CurrencyTable(tableType: TableType, completion: @escaping ([CurrencyListAB_ApiResponseModel]?, NetworkError?) -> Void) {
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
                let error = NetworkErrorStruct(statusCode: error?.statusCode, description: error?.localizedDescription)
                    completion(nil, error)
                    return
                }
            do {
                
                if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                    print(JSONString)
                }
                let jsonModels = try jsonDecoder.decode([CurrencyListAB_ApiResponseModel].self, from: data)
                //let models = ListAB_Model.convertArray(apiModels: jsonModels)
                completion(jsonModels, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
    
    func getC_CurrencyTable(completion: @escaping ([CurrencyListC_ApiResponseModel]?, NetworkError?) -> Void) {
        let request = CurrencyListApiRequest(tableType: .c)

        self.runRequest(request) { (_, data, error) in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let error = NetworkErrorStruct(statusCode: error?.statusCode, description: error?.localizedDescription)
                    completion(nil, error)
                    return
                }
            do {
                let model = try jsonDecoder.decode([CurrencyListC_ApiResponseModel].self, from: data)
                completion(model, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
}

