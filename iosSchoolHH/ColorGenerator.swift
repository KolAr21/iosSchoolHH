//
//  ColorGenerator.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

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

class ColorGenerator {
    var alpha: Double
    let colorCodes: [Double] = [0.0, 51.0, 102.0, 153.0, 204.0, 255.0]

    init(alpha: Double) {
        self.alpha = alpha
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
