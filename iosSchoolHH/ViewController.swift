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
        characterGenerator.generateNameOne { print($0) }

        characterGenerator.generateNameTwo { [weak characterGenerator] in
            guard let characterGenerator else {
                return  ""
            }
            return characterGenerator.randomStringOfLetters(length: Int.random(in: 1...7))
        }

        characterGenerator.generateNameTree()("John")
        print(characterGenerator.generateNameFour()())
    }
}
