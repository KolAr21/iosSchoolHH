//
//  CharacterCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import UIKit

final class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {

    struct Context {
        let data: LocationCellData
    }

    override func make() -> UIViewController? {
        assembly.characterVC(data: context.data)
    }
}
