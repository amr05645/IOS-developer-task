//
//  NetworkManager.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import Foundation

class NetworkManager {
    
    var baseURL = "http://api.tvmaze.com/search/shows?q=Future"
    
    func getData(completion: @escaping (Result<PostDetails?, Error>) -> Void) {
        let url = URL(string: baseURL)
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("Error took place \(error)")
                return
            }
            if let data = data {
                do {
                    let postDetails = try JSONDecoder().decode(PostDetails.self, from: data)
                    completion(.success(postDetails))
                    print(postDetails)
                }
                catch let jsonError
                {
                    completion(.failure(jsonError))
                    print("error serializing json", jsonError)
                }
            }
        }
        task.resume()
    }
    
}

