//
//  Resource.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/26/24.
//

import Foundation

struct Resource<T: Decodable> {
    var base: String
    var path: String
    var params: [String: String]
    var header: [String: String]
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents(string: base + path)!
        let queryItems = params.map { (key: String, value : String) in
                URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        print(request.url!)
        header.forEach { (key: String , value : String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
