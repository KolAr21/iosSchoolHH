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
        let registrationCoordinator = assembly.registrationCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: registrationCoordinator.make())
    }

    private func authBootstrap() {
        let authCoordinator = assembly.authCoordinator { [weak self] in
            self?.locationBootstrap()
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func locationBootstrap() {
        let locationCoordinator = assembly.locationCoordinator { [weak self] in
            self?.characterBootstrap()
        }
        setRoot(viewController: locationCoordinator.make())
    }

    private func characterBootstrap() {
        setRoot(viewController: assembly.characterCoordinator().make())
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
