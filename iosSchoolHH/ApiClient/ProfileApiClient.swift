//
//  ProfileApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import Foundation

protocol ProfileApiClient {
    func profile(userId: String, onRequestCompleted: @escaping (Profile?, ApiError?) -> Void)
}

extension ApiClient: ProfileApiClient {
    func profile(userId: String, onRequestCompleted: @escaping (Profile?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.nanoPost + "/v1/profile/\(userId)"
        performRequest(url: url, data: nil, method: .get) { (result: Result<Profile, ApiError>) in
            switch result {
            case .success(let profile):
                onRequestCompleted(profile, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
