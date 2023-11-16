//
//  RegistrationApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol RegistrationApiClient {
    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost +
            "/auth/register?username=\(user.username)&password=\(user.password)"
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
