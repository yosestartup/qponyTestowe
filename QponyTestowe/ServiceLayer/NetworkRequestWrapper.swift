//
//  NetworkRequestWrapper.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/10/2019.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct Environment {
    static var baseUrl: String = "http://api.nbp.pl/api"
}
    
protocol NetworkRequestWrapperProtocol {
    func runRequest(_ request: NetworkRequest, completion: @escaping(_ statusCode: Int, _ requestData: Data?, _ error: NetworkError?) -> Void)
}

class NetworkRequestWrapper: NetworkRequestWrapperProtocol {
    func runRequest(_ request: NetworkRequest, completion: @escaping(_ statusCode: Int, _ requestData: Data?, _ error: NetworkError?) -> Void) {

        self.runWith(target: request, completion: { (statusCode, data, error) in
            let body: String? = (data != nil) ? (String.init(data: data!, encoding: .utf8)) : ""
            print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
            print("Request url: \(Environment.baseUrl + request.path)")
            print("Request error code \(String(describing: error?.errorCode)) body: \(String(describing: error?.plainBody))")
            print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
            completion(statusCode, data, error)
        })
    }

    private func runWith(target: NetworkRequest, completion: @escaping(_ statusCode: Int, _ responseData: Data?, _ error: NetworkError?) -> Void) {
        
        var urlString: String = Environment.baseUrl + target.path
        if (target.method == .get) {
            urlString += NetworkRequestWrapper.buildQueryString(fromDictionary:target.params as! [String : String])
        }
        
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        switch(target.method) {
            case .get:
            request.httpMethod = "GET";
        }
        
        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in

            if error != nil || data == nil {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: error?.localizedDescription ?? "Undefined error", code: statusCode, userInfo: nil)
                let networkError = NetworkErrorStruct.init(error: error)
                completion(statusCode, nil, networkError)
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                let statusCode = 0
                let error = NSError(domain: error?.localizedDescription ?? "Undefined error", code: 0, userInfo: nil)
                let networkError = NetworkErrorStruct.init(error: error)
                completion(statusCode, nil, networkError)
                return
            }

            completion(response.statusCode, data, nil)
        }

        task.resume()

    }
}

extension NetworkRequestWrapper {
  static func buildQueryString(fromDictionary parameters: [String:String]) -> String {
        var urlVars:[String] = []

        for (k,value) in parameters {
            if let encodedValue = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                urlVars.append(k + "=" + encodedValue)
            }
        }

        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}
