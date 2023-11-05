//
//  ColorGenerator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import UIKit

struct Color {
    var alpha: Brightness = .average
    let red: Double
    let blue: Double
    let green: Double

    private func description() {
        print("R:\(red) B:\(blue) G:\(green), alpha: \(alpha.rawValue)")
    }

    init(red: Double, blue: Double, green: Double) {
        self.red = red
        self.blue = blue
        self.green = green
    }
}

protocol ColorGeneratorProtocol {
    var alpha: Double { get set }
    var colorCodes: [Double] { get }

    func createColor() -> UIColor
    init(alpha: Double)
}

extension ColorGeneratorProtocol {
    func createColor() -> UIColor {
        UIColor(white: 1, alpha: alpha)
    }
}

class ColorGenerator: ColorGeneratorProtocol {
    var alpha: Double
    var colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]
    let whiteColor: UIColor = .white

    func createColor() -> UIColor {
        UIColor(white: 1, alpha: alpha)
    }

    func changeColorCodes(completion: ([Double]) -> Void) {
        completion([])
    }

    required init(alpha: Double) {
        self.alpha = alpha
    }

    func changeColor(completion: () -> ([Double])) {
        colorCodes = completion()
        print(colorCodes)
    }

    func test() {
        changeColorCodes { [weak self] newColorCodes in
            self?.colorCodes = newColorCodes
        }

        changeColor { [weak self] in
            guard let self else { return [] }
            self.colorCodes = [0, 1, 2]
            return self.colorCodes
        }
    }

    func convertToArray<T>(element: T) -> [T] {
        [element]
    }

    func printAlphaSecond<T: ColorGeneratorProtocol>(generator: T) {
        print(generator.alpha)
    }

    func printAlpha<Generator>(generator: Generator) where Generator: ColorGeneratorProtocol {
        print(generator.alpha)
    }

    func printAlphaAny(generator: Any) {
        guard let generator = generator as? ColorGeneratorProtocol else { return }
        print(generator.alpha)
    }

}

enum Brightness: Double {
    case din = 0.1
    case average = 0.5
    case bright = 1

    func description() -> String {
        switch self {
        case .din:
            return "Тусклый"
        case .average:
            return "Средний"
        case .bright:
            return "Яркий"
        }
    }

}

class Palette<CustomColor> {
    let colors: [CustomColor]

    init(colors: [CustomColor]) {
        self.colors = colors
    }
}
