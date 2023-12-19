//
//  PersonDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

protocol PersonDataProvider {
    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void)
}

final class PersonDataProviderImp: PersonDataProvider {
    private let apiClient: PersonApiClient

    init(apiClient: PersonApiClient) {
        self.apiClient = apiClient
    }

    func episode(url: String, onRequestCompleted: @escaping (Episode?, ApiError?) -> Void) {
        apiClient.episode(url: url, onRequestCompleted: onRequestCompleted)
    }
}
