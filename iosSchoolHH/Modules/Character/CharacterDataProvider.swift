//
//  CharacterDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol CharacterDataProvider {
    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
}

final class CharacterDataProviderImp: CharacterDataProvider {
    private let apiClient: CharacterApiClient

    init(apiClient: CharacterApiClient) {
        self.apiClient = apiClient
    }

    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        apiClient.character(url: url, onRequestCompleted: onRequestCompleted)
    }
}
