//
//  LocationCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import UIKit

class LocationCoordinator: BaseCoordinator<LocationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.locationVC()
    }
}
