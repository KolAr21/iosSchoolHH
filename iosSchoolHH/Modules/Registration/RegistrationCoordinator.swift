//
//  RegistrationCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

class RegistrationCoordinator: BaseCoordinator<RegistrationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.registrationVC()
    }
}
