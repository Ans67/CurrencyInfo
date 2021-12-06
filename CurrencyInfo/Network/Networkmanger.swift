//
//  Networkmanger.swift
//  CurrencyInfo
//
//  Created by ANAS MANSURI on 06/12/21.
//

import Foundation

public typealias Parameters = Data? // params
public typealias HTTPHeaders = [String: String] // headers

public enum HTTPMethod : String{
    case get = "GET"
    case post = "post"
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkManger{
    
    static let sharedInstance = NetworkManger()
    
    private init(){}
    
    // Send Request
    public func sendRequest<T: Decodable>(for: T.Type = T.self,
                                          url: String,
                                          method: HTTPMethod,
                                          headers: HTTPHeaders? = nil,
                                          body: Parameters? = nil,
                                          completion: @escaping (Result<T>) -> Void) {

        return sendRequest(url, method: method, headers: headers, body:body) { data, response, error in
            guard let data = data else {
                return completion(.failure(error ?? NSError(domain: "SomeDomain", code: -1, userInfo: nil)))
            }
            do {
                let decoder = JSONDecoder()
                try completion(.success(decoder.decode(T.self, from: data)))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
    }
    
    
    public func sendRequest(_ url: String,
                            method: HTTPMethod,
                            headers: HTTPHeaders? = nil,
                            body: Parameters? = nil,
                            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: url)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
       
       // urlRequest.httpBody = data //try? JSONSerialization.data(withJSONObject: parameters)
        
        if let headers = headers {
            urlRequest.allHTTPHeaderFields = headers
            //  urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        if let body = body {
            urlRequest.httpBody = body
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            completionHandler(data, response, error)
        }
        
        task.resume()
    }

}
