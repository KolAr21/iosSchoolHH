//
//  Assembly.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 26.10.2023.
//

import UIKit

final class Assembly {

    lazy var imageService: ImageService = ImageServiceImp(apiClient: apiClient)
    lazy var storageManager: StorageManager = StorageManagerImp()

    var apiClient: ApiClient {
        ApiClient()
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
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
