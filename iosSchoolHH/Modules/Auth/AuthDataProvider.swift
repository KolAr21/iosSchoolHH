//
//  AuthDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import Foundation

protocol AuthDataProvider {
    func auth(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

final class AuthDataProviderImp: AuthDataProvider {
    private let apiClient: AuthApiClient

    init(apiClient: AuthApiClient) {
        self.apiClient = apiClient
    }

    func auth(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        apiClient.auth(login: login, password: password, onRequestCompleted: onRequestCompleted)
    }
}
