//
//  AppCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

struct CoordinatorContext {}

final class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(viewController: coordinator.make())
    }

    // MARK: - Private func

    private func authBootstrap() {
        guard assembly.storageManager.getToken() == nil else {
            setTabVC()
            return
        }

        let authCoordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()

        let locationsCoord = assembly.locationCoordinator()
        // let cabinetCoord = assembly.cabinetCoodrinator()
        guard let locationsVC = locationsCoord.make()/*, let cabinetVC = cabinetCoord.make()*/ else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = RootTab.locations.tabBarItem

        // cabinetVC.tabBarItem = RootTab.cabinet.tabBarItem
        tabVC.setViewControllers([navVC], animated: false)
        setRoot(viewController: tabVC)
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }

        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
