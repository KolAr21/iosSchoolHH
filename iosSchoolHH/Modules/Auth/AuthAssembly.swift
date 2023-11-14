//
//  AuthAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC(onAuthSuccess: (() -> Void)?) -> AuthViewController
    func authDataProvider() -> AuthDataProvider
    func authCoordinator(onAuthSuccess: (() -> Void)?) -> AuthCoordinator
}

extension Assembly: AuthAssembly {
    func authVC(onAuthSuccess: (() -> Void)?) -> AuthViewController {
        .init(dataProvider: authDataProvider(), onAuthSuccess: onAuthSuccess)
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp(apiClient: apiClient)
    }

    func authCoordinator(onAuthSuccess: (() -> Void)?) -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init(onAuthSuccess: onAuthSuccess))
    }
}
