//
//  CharacterDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol CharacterDataProvider {
    func character(onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
}

class CharacterDataProviderImp: CharacterDataProvider {
    private let apiClient: CharacterApiClient

    init(apiClient: CharacterApiClient) {
        self.apiClient = apiClient
    }

    func character(onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        apiClient.character(onRequestCompleted: onRequestCompleted)
    }
}
