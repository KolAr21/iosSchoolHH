//
//  AppCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        let registrationCoordinator = assembly.registrationCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: assembly.authCoordinator().make())
    }

    private func authBootstrap() {
        print("sixth-homework")
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
