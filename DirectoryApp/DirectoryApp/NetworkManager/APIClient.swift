//
//  APIClient.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 24/10/22.
//

import Foundation

class APIClient{
    static let shared = APIClient()

    
    public func loadRequest<T : Decodable>(_ objectType: T.Type,with endpoint: APIEndpoint, success: @escaping (_ response:T)  -> Void,failure: @escaping (_ errorNoData:Error)  -> Void) throws {
        let request = try createRequest(from: endpoint)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {failure(error); return }
               do {
                   let response = try JSONDecoder().decode(T.self, from: data!)
                   DispatchQueue.main.async { success(response )}
               } catch {
                   DispatchQueue.main.async { failure(error) }
               }
           }
           task.resume()
        
    }
}
private extension APIClient {
    
    func createRequest(from endpoint: APIEndpoint) throws -> URLRequest {
        guard
            let urlPath = URL(string: Environment.apiBaseURL.appending(endpoint.path)),
            var urlComponents = URLComponents(string: urlPath.path)
        else {
            throw ApiError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
