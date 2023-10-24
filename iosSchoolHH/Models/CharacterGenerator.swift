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
        let species = randomString(length: 10)
        let image = randomString(length: 12)
        let url = "pinterest.com/pin/" + randomString(length: 17)
        let gender = Character.Gender.allCases.randomElement()
        let status = Character.Status.allCases.randomElement()

        return Character(id: id, name: name ?? nameMock[0], species: species,
                         image: image, url: url, gender: gender ?? Character.Gender.unknown,
                         status: status ?? Character.Status.unknown)
    }

    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }
}
