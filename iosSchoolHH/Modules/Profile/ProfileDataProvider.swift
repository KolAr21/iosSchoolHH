//
//  ProfileDataProvider.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import Foundation

protocol ProfileDataProvider {
    func profile(userId: String, onRequestCompleted: @escaping (Profile?, ApiError?) -> Void)
}

final class ProfileDataProviderImp: ProfileDataProvider {
    private let apiClient: ProfileApiClient

    init(apiClient: ProfileApiClient) {
        self.apiClient = apiClient
    }

    func profile(userId: String, onRequestCompleted: @escaping (Profile?, ApiError?) -> Void) {
        apiClient.profile(userId: userId, onRequestCompleted: onRequestCompleted)
    }
}
