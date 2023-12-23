//
//  LocationApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol LocationApiClient {
    func location(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

extension ApiClient: LocationApiClient {
    func location(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.locationURL
        performRequest(url: url, data: nil, method: .get) { (result: Result<LocationsList, ApiError>) in
            switch result {
            case .success(let location):
                onRequestCompleted(location, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
