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
        characterGenerator.generateNameOne { (name: String) in
            print(name)
        }

        let closureTwo: () -> (String) = { [weak characterGenerator] in
            guard let characterGenerator else { return  "" }
            return characterGenerator.randomStringOfLetters(length: Int.random(in: 1...7))
        }

        characterGenerator.generateNameTwo(completion: closureTwo)
        let getReversedName = characterGenerator.generateNameTree()
        getReversedName("John")
        let getName = characterGenerator.generateNameFour()
        print(getName())
    }
}
