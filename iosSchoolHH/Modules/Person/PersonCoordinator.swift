//
//  PersonCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

final class PersonCoordinator: BaseCoordinator<PersonCoordinator.Context> {

    struct Context {
        let data: CharacterCellData
    }

    override func make() -> UIViewController? {
        assembly.personVC(data: context.data)
    }
}
