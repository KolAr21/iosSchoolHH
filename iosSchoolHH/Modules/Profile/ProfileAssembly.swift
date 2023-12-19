//
//  ProfileAssembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import Foundation

protocol ProfileAssembly {
    func profileVC(onProfileLogout: (() -> Void)?) -> ProfileViewController<ProfileViewImp>
    func profileDataProvider() -> ProfileDataProvider
    func profileCoordinator(onProfileLogout: (() -> Void)?) -> ProfileCoordinator
}

extension Assembly: ProfileAssembly {
    func profileVC(onProfileLogout: (() -> Void)?) -> ProfileViewController<ProfileViewImp> {
        .init(dataProvider: profileDataProvider(), storageManager: storageManager, onProfileLogout: onProfileLogout)
    }

    func profileDataProvider() -> ProfileDataProvider {
        ProfileDataProviderImp(apiClient: apiClient)
    }

    func profileCoordinator(onProfileLogout: (() -> Void)?) -> ProfileCoordinator {
        ProfileCoordinator(assembly: self, context: .init(onProfileLogout: onProfileLogout))
    }
}
