//
//  CharacterGenerator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

class CharacterGenerator {

    let nameMock = ["Bob", "John", "Alex", "Phill", "Diana", "Mary", "Peter"]

    func generate() -> Character {
        let id = Int.random(in: 0...1000)
        let name = nameMock.randomElement()
        let species = randomStringOfLetters(length: 10)
        let image = randomStringOfLetters(length: 12)
        let url = "https://ru.pinterest.com/pin/" + randomStringOfNumbers(length: 18)
        var episode: [String] = []
        let countOfEpisode = Int.random(in: 1...5)
        for _ in 0...countOfEpisode {
            let lengthNewString = Int.random(in: 0...8)
            let newString = randomStringOfLetters(length: lengthNewString)
            episode.append(newString)
        }
        let gender = Character.Gender.allCases.randomElement()
        let status = Character.Status.allCases.randomElement()

        return Character(id: id, name: name ?? nameMock[0], species: species,
                         image: image, url: url, episode: episode, gender: gender ?? Character.Gender.unknown,
                         status: status ?? Character.Status.unknown)
    }

    func randomStringOfLetters(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }

    func randomStringOfNumbers(length: Int) -> String {
        let numbers = "0123456789"
        return String((0..<length).map { _ in numbers.randomElement() ?? "0" })
    }
}
