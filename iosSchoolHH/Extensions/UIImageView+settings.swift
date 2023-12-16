//
//  UIImageView+settings.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 16.12.2023.
//

import UIKit

extension UIImageView {
    func setSettingsImage() {
        clipsToBounds = false
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 1
    }
}
