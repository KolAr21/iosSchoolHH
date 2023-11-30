//
//  Assembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 26.10.2023.
//

import UIKit

final class Assembly {

    var apiClient: ApiClient {
        ApiClient()
    }

    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: .init())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
