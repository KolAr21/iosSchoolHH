//
//  AuthApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 13.11.2023.
//

import Foundation

protocol AuthApiClient {
    func auth(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: AuthApiClient {
    func auth(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/login?username=\(login)&password=\(password)"
        performRequest(url: url, data: nil, method: .get) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
