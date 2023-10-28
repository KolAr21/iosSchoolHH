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
        for _ in 0...5 {
            let character = characterGenerator.generate()
            print(character.id, character.name, character.species, character.image,
                  character.url, character.episode, character.gender, character.status)
        }
    }
}
