//
//  ProfileCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit

final class ProfileCoordinator: BaseCoordinator<ProfileCoordinator.Context> {

    struct Context {
        let onProfileLogout: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.profileVC(onProfileLogout: context.onProfileLogout)
    }
}
