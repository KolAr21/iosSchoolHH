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

        let generator = ColorGenerator(alpha: 1)
        generator.changeColorCodes { colorCodes in
            print(colorCodes)
        }

        generator.changeColor {
            [0]
        }
    }
}
