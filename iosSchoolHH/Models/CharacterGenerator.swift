//
//  CharacterGenerator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

final class CharacterGenerator {

    private let nameMock = ["Bob", "John", "Alex", "Phill", "Diana", "Mary", "Peter"]

    func generate() -> Character {
        return Character(id: Int.random(in: 0...1000),
                         name: nameMock.randomElement() ?? nameMock[0],
                         species: randomStringOfLetters(length: 10),
                         image: randomStringOfLetters(length: 12),
                         url: "https://ru.pinterest.com/pin/" + randomStringOfNumbers(length: 18),
                         episode: Array((0..<Int.random(in: 1...5)).map { _ in
                                  randomStringOfLetters(length: Int.random(in: 1...8)) }),
                         gender: Character.Gender.allCases.randomElement() ?? Character.Gender.unknown,
                         status: Character.Status.allCases.randomElement() ?? Character.Status.unknown)
    }

    private func randomStringOfLetters(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }

    private func randomStringOfNumbers(length: Int) -> String {
        let numbers = "0123456789"
        return String((0..<length).map { _ in numbers.randomElement() ?? "0" })
    }
}
