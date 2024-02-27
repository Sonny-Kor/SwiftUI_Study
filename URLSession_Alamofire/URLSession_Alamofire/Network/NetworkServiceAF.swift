//
//  NetworkServiceAF.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/26/24.
//

import Foundation
import Alamofire

final class NerworkServiceAF {
    func load<T: Decodable>(_ resource : Resource<T>, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(resource.urlRequest!)
            .validate()
            .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        
        }
    }
}
