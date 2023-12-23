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
        let characterVC = assembly.characterVC(data: context.data)
        characterVC.selectCharacter = { [weak characterVC] characterVM in
            let coordinator = self.assembly.personCoordinator(data: characterVM)
            guard let personVC = coordinator.make() else {
                return
            }
            characterVC?.navigationController?.pushViewController(personVC, animated: true)
        }
        return characterVC
    }
}
