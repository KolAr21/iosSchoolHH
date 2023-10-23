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

        var color = Color(red: 1, blue: 1, green: 1)
        color.alpha = .bright

        var nextColor = color
        nextColor.alpha = .average

        let generator = ColorGenerator(alpha: 0.5)
        generator.alpha = 1

        let nextGenerator = generator
        nextGenerator.alpha = 0.5

        let alpha: Brightness = .average
        let description = alpha.description()
        print(description)
    }
}
