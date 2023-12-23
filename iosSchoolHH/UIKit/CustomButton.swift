//
//  CustomButton.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 17.12.2023.
//
import UIKit

final class CustomButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        backgroundColor = UIColor(named: "blue")
        layer.cornerRadius = 10
    }
}
