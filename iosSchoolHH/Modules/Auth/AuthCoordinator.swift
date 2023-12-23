//
//  AuthCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

final class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {
    struct Context {
        let onOpenLogin: (() -> Void)?
    }

    override func make() -> UIViewController? {
        let controller = assembly.authVC(onOpenLogin: context.onOpenLogin)
        controller.onOpenRegistration = { [weak controller] in
            let coordinator = self.assembly.registrationCoordinator { [weak self] in
                DispatchQueue.main.async {
                    self?.context.onOpenLogin?()
                }
            }
            guard let registrationVC = coordinator.make() else {
                return
            }
            registrationVC.modalPresentationStyle = .fullScreen
            controller?.present(registrationVC, animated: true)
        }
        return controller
    }
}
