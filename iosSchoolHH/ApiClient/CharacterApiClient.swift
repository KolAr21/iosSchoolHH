//
//  CharacterApiClient.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import Foundation

protocol CharacterApiClient {
    func character(onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void)
}

extension ApiClient: CharacterApiClient {
    func character(onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        let url = NetworkConstants.URLStrings.characterURL + "/2"
        performRequest(url: url, data: nil, method: .get) { (result: Result<Character, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }

    func character(url: String, onRequestCompleted: @escaping (Character?, ApiError?) -> Void) {
        performRequest(url: url, data: nil, method: .get) { (result: Result<Character, ApiError>) in
            switch result {
            case .success(let character):
                onRequestCompleted(character, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
}
