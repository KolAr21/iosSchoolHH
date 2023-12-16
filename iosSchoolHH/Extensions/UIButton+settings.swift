//
//  UIButton+settings.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 10.12.2023.
//

import UIKit

extension UIButton {
    func setSettingsButton() {
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        backgroundColor = UIColor(named: "blue")
        layer.cornerRadius = 10
    }
}
