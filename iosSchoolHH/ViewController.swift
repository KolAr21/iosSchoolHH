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

        let generator = ColorGenerator(alpha: 1)
        generator.changeColorCodes { colorCodes in
            print(colorCodes)
        }

        generator.changeColor {
            [0]
        }

        let color = ColorGenerator(alpha: 1)

        let intArray = generator.convertToArray(element: 1)
        let colorArr = generator.convertToArray(element: color)
        let stringArray = generator.convertToArray(element: "hello world")

        let palette = Palette(colors: [1, 2, 3, 4])
        let anotherPalette = Palette(colors: ["red", "green"])
        let colorPalette = Palette(colors: [color])
        let pal = Palette(colors: colorArr)

        let arrayInt = [1, 2, 3, 4, 5, 6, 7]
        let result = arrayInt.filter { elem in
            return elem % 2 == 0
        }

        let resultOne = arrayInt.filter { $0 % 2 == 0 }

        let array = [0.1, 0.2, 0.5, 1]
        let generators = array.map { ColorGenerator(alpha: $0)}
        let test = array.map { alpha -> ColorGeneratorProtocol? in
            guard alpha < 1 else { return nil }
            return ColorGenerator(alpha: alpha)
        }

        let testOne: [ColorGenerator?] = array.map {
            guard $0 < 1 else { return nil }

            return ColorGenerator(alpha: $0)
        }

        let testTwo = testOne.compactMap { $0 }
        let testThree = testOne.compactMap { $0?.alpha }
        let testFour = testOne.map { $0?.alpha }

        let resultReduce = arrayInt.reduce(0) { partialResult, element in
            partialResult + element
        }

    }
}
