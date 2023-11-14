//
//  RegistrationApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let user = User(username: login, password: password)
        let url = NetworkConstants.URLStrings.nanoPost +  "/auth/register?username=\(login)&password=\(password)"
        let data = try? JSONEncoder().encode(user)
        performRequest(url: url, data: data, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
