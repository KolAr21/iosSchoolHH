//
//  CharacterCoordinator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//

import UIKit

class CharacterCoordinator: BaseCoordinator<CharacterCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        assembly.characterVC()
    }

}
