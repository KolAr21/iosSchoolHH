//
//  CharacterGenerator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

protocol CharacterGeneratorProtocol {
    func generate(id: Int?, name: String?, episode: [String]?) -> Character
}

final class CharacterGenerator: CharacterGeneratorProtocol {

    private var nameMock = ["Bob", "John", "Alex", "Phill", "Diana", "Mary", "Peter"]

    func generate(id: Int?, name: String?, episode: [String]?) -> Character {
        Character(
            id: id ?? Int.random(in: 0...1000),
            name: name ?? nameMock.randomElement() ?? nameMock[0],
            species: randomStringOfLetters(length: 10),
            image: randomStringOfLetters(length: 12),
            url: "https://ru.pinterest.com/pin/" + randomStringOfNumbers(length: 18),
            episode: episode ?? (0..<Int.random(in: 1...5)).map { _ in
                randomStringOfLetters(length: Int.random(in: 1...8))
            },
            gender: Character.Gender.allCases.randomElement() ?? Character.Gender.unknown,
            status: Character.Status.allCases.randomElement() ?? Character.Status.unknown
        )
    }

    func randomStringOfLetters(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }

    func randomStringOfNumbers(length: Int) -> String {
        let numbers = "0123456789"
        return String((0..<length).map { _ in numbers.randomElement() ?? "0" })
    }

    func generateNameOne(completion: (String) -> Void) {
        completion(nameMock[Int.random(in: 0..<nameMock.count)])
    }

    func generateNameTwo(completion: () -> (String)) {
        nameMock.append(completion())
    }

    func generateNameTree() -> (String) -> Void {
        { print(String($0.reversed())) }
    }

    func generateNameFour() -> (() -> String) {
        { [weak self] in
            guard let self else {
                return ""
            }
            return self.randomStringOfLetters(length: Int.random(in: 1...7))
        }
    }
}
