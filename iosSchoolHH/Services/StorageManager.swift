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
    func getToken() -> String?
    func removeToken()

    func saveUserId(token: TokenResponse)
    func getUserId() -> String?
    func removeUserId()

    func saveDateLastLogin()
    func getDateLastLogin() -> String
}

final class StorageManagerImp: StorageManager {
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

    func getToken() -> String? {
        do {
            guard let token = try keychain.get(StorageManagerKey.token.rawValue) else {
                return nil
            }

            return token
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

    func saveUserId(token: TokenResponse) {
        do {
            try keychain.set(token.userId, key: StorageManagerKey.userId.rawValue)
        } catch {
            print(error as Any)
        }
    }

    func getUserId() -> String? {
        do {
            guard let userId = try keychain.get(StorageManagerKey.userId.rawValue) else {
                return nil
            }

            return userId
        } catch {
            print(error as Any)
        }
        return nil
    }

    func removeUserId() {
        do {
            try keychain.remove(StorageManagerKey.userId.rawValue)
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
        case userId
        case notFirstLaunch
        case lastLoginDate
    }

    struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }

    // MARK: - Private methods

    private func notFirstLaunch() -> Bool {
        UserDefaults.standard.bool(forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }

    private func saveFirstLaunch() {
        UserDefaults.standard.set(true, forKey: StorageManagerKey.notFirstLaunch.rawValue)
    }
}
