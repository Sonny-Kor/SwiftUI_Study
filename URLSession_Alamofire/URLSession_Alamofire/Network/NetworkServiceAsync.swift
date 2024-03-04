//
//  NetworkServiceAsync.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 3/4/24.
//

import Foundation

extension NetworkService {
    func loadAsync<T: Decodable>(_ resource: Resource<T>) async throws -> T {
        guard let request = resource.urlRequest else {
            throw NetworkError.invalidRequest
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else{
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw NetworkError.responseError(statusCode: statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.jsonDecodingError(error: error)
        }
    }
}
