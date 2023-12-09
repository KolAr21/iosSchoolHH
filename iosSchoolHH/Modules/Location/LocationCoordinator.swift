//
//  LocationCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import UIKit

final class LocationCoordinator: BaseCoordinator<LocationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        let locationVC = assembly.locationVC()
        locationVC.selectLocation = { [weak locationVC] locationData in
            let coordinator = self.assembly.characterCoordinator(data: locationData)
            guard let characterVC = coordinator.make() else {
                return
            }
            locationVC?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return locationVC
    }
}
