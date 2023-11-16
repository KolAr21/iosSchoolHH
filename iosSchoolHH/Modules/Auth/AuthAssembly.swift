//
//  AuthAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC() -> AuthViewController<AuthViewImp>
    func authDataProvider() -> AuthDataProvider
    func authCoordinator() -> AuthCoordinator
}

extension Assembly: AuthAssembly {
    func authVC() -> AuthViewController<AuthViewImp> {
        .init(dataProvider: authDataProvider())
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp(apiClient: apiClient)
    }

    func authCoordinator() -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init())
    }
}
