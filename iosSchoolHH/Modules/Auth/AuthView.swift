//
//  AuthView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

protocol AuthView: UIView {
    func setView()
}

class AuthViewImp: UIView, AuthView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var registrationButton: UIButton!

    func setView() {
        imageView.image = UIImage(named: "auth-background")
        imageView.contentMode = .scaleAspectFill
        layer.cornerRadius = 10
        labelView.layer.masksToBounds = true
        labelView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowRadius = 10
        labelView.layer.shadowOffset = CGSize(width: 0, height: 8)
        labelView.backgroundColor = UIColor(red: 196, green: 196, blue: 196, alpha: 0.65)
    }
}
