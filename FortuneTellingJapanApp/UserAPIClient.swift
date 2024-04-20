//
//  UserAPIClient.swift
//  FortuneTellingJapanApp
//
//  Created by Gomi Kouki on 2024/04/17.
//

import Foundation
import Alamofire

class UserAPIClient {
    static let shared = UserAPIClient()
    private init() {}
    
    let url = "https://yumemi-ios-junior-engineer-codecheck.app.swift.cloud/my_fortune"
    
    func sendUserData(userData:User, completion: @escaping (Result<Any, Error>) -> Void) {
        
        let headers: HTTPHeaders = [
            "API-Version": "v1"
        ]
        
        AF.request(url, method: .post, parameters: userData, encoder: JSONParameterEncoder.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

