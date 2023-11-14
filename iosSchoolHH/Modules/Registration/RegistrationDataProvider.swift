//
//  RegistrationDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import Foundation

protocol RegistrationDataProvider {
    func registration(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

class RegistrationDataProviderImp: RegistrationDataProvider {
    private let apiClient: RegistrationApiClient

    init(apiClient: RegistrationApiClient) {
        self.apiClient = apiClient
    }

    func registration(
        login: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        apiClient.registration(login: login, password: password, onRequestCompleted: onRequestCompleted)
    }
}
