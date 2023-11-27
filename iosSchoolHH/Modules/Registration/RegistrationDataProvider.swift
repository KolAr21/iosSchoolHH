//
//  RegistrationDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import Foundation

protocol RegistrationDataProvider {
    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

final class RegistrationDataProviderImp: RegistrationDataProvider {
    private let apiClient: RegistrationApiClient

    init(apiClient: RegistrationApiClient) {
        self.apiClient = apiClient
    }

    func registration(
        user: User,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        apiClient.registration(user: user, onRequestCompleted: onRequestCompleted)
    }
}
