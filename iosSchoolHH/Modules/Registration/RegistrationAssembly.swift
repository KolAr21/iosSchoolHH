//
//  RegistrationAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import Foundation

protocol RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp>
    func registrationDataProvider() -> RegistrationDataProvider
    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator
}

extension Assembly: RegistrationAssembly {
    func registrationVC(onRegistrationSuccess: (() -> Void)?) -> RegistrationViewController<RegistrationViewImp> {
        .init(
            dataProvider: registrationDataProvider(),
            storageManager: storageManager,
            onRegistrationSuccess: onRegistrationSuccess
        )
    }

    func registrationDataProvider() -> RegistrationDataProvider {
        RegistrationDataProviderImp(apiClient: apiClient)
    }

    func registrationCoordinator(onRegistrationSuccess: (() -> Void)?) -> RegistrationCoordinator {
        RegistrationCoordinator(assembly: self, context: .init(onRegistrationSuccess: onRegistrationSuccess))
    }
}
