//
//  AuthCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

    struct Context {
        let onAuthSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.authVC(onAuthSuccess: context.onAuthSuccess)
    }
}
