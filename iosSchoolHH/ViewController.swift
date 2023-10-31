//
//  ViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 19.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let characterGenerator = CharacterGenerator()
        let character = characterGenerator.generate()
        let characterGeneratorProtocol: CharacterGeneratorProtocol = CharacterGenerator()
        let characterProtocol = characterGeneratorProtocol.generate()

        print(
            character.id,
            character.name,
            character.species,
            character.image,
            character.url,
            character.episode,
            character.gender,
            character.status
        )

        print(
            characterProtocol.id,
            characterProtocol.name,
            characterProtocol.species,
            characterProtocol.image,
            characterProtocol.url,
            characterProtocol.episode,
            characterProtocol.gender,
            characterProtocol.status
        )

    }
}
