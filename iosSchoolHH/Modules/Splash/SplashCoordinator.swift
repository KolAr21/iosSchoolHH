//
//  SplashCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

final class SplashCoordinator: BaseCoordinator<SplashCoordinator.Context> {
    struct Context {
        let onSuccess: (() -> Void)?
    }

    override func make() -> UIViewController? {
        assembly.splashVC(onSuccess: context.onSuccess)
    }
}
