//
//  StorageManager.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 04.12.2023.
//

import Foundation
import KeychainAccess

protocol StorageManager {
    func cleanKeychainIfNeeded()
    func saveToken(token: TokenResponse)
    func getToken() -> TokenResponse?
    func removeToken()

    func saveDateLastLogin()
    func getDateLastLogin() -> String
}

class StorageManagerImp: StorageManager {

    private let keychain = Keychain(service: Constants.serviceId)

    func cleanKeychainIfNeeded() {
        guard !notFirstLaunch() else {
            return
        }

        do {
            try keychain.removeAll()
        } catch {
            print(error as Any)
        }
        saveFirstLaunch()
    }

    func saveToken(token: TokenResponse) {
        do {
            try keychain.set(token.token, key: StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getToken() -> TokenResponse? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }
            return TokenResponse(token: token)
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeToken() {
        do {
            try keychain.remove(StorageManagerKey.token.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func saveDateLastLogin() {
        UserDefaults.standard.set(Date().dateTimeString, forKey: StorageManagerKey.lastLoginDate.rawValue)
    }

    func getDateLastLogin() -> String {
        UserDefaults.standard.string(forKey: StorageManagerKey.lastLoginDate.rawValue) ?? ""
    }
}

private extension StorageManagerImp {
    enum StorageManagerKey: String {
        case token
        case notFirstLaunch
        case lastLoginDate
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }

    private func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    private func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
