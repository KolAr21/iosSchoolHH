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
        var arrayOfCharacters: [Character] = []
        for _ in 0...9 {
            arrayOfCharacters.append(characterGenerator.generate(id: nil, name: nil, episode: nil))
        }
        printArrayOfCharacter(arrayOfCharacters: arrayOfCharacters.filter { $0.gender == .male })

        printArrayOfCharacter(arrayOfCharacters: arrayOfCharacters.filter { $0.name.contains("a") })

        let nameMock = ["Bob", "John", "Alex", "Phill", "Diana", "Mary", "Peter", "Alice", "Peter", "Jane"]
        printArrayOfCharacter(arrayOfCharacters: nameMock.enumerated().map {
            characterGenerator.generate(id: $0, name: $1, episode: nil)
        })

        let episodes: [[String]?] = [["War", "Night"], ["Love"]]
        let charactersWithEpisodeMap =  episodes.map { episodes in
            (0...2).map { _ in
                characterGenerator.generate(id: nil, name: nil, episode: episodes)
            }
        }

        charactersWithEpisodeMap.forEach { printArrayOfCharacter(arrayOfCharacters: $0) }

        let charactersWithEpisodeCompactMap = episodes.compactMap { episodes in
            (0...2).map { _ in
                characterGenerator.generate(id: nil, name: nil, episode: episodes)
            }
        }

        charactersWithEpisodeCompactMap.forEach { printArrayOfCharacter(arrayOfCharacters: $0) }

        print(arrayOfCharacters.reduce("", { $0 + $1.name }))
    }

    private func printArrayOfCharacter(arrayOfCharacters: [Character]) {
        for character in arrayOfCharacters {
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
        }
    }
}
