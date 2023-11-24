//
//  RegistrationView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    var delegate: RegistrationViewDelegate? { get set }
    func setView()
}

protocol RegistrationViewDelegate: AnyObject {
    func backButtonDidTap()
    func registrationButtonDidTap(login: String, password: String)
}

class RegistrationViewImp: UIView, RegistrationView {
    weak var delegate: RegistrationViewDelegate?

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var avatarView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var registrationButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    func setView() {
        imageView.image = UIImage(named: "registration-background")
        imageView.contentMode = .scaleAspectFill

        avatarView.clipsToBounds = false
        avatarView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        avatarView.layer.shadowRadius = 8
        avatarView.layer.shadowOffset = CGSize(width: 0, height: 5)
        avatarView.layer.shadowOpacity = 1
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        avatar.image = UIImage(named: "registration-avatar")
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        avatarView.addSubview(avatar)

        setSettingsTextField(textField: &loginTextField)
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите логин",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(red: 0.318, green: 0.306, blue: 0.306, alpha: 1)]
        )

        setSettingsTextField(textField: &passwordTextField)
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите пароль",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(red: 0.318, green: 0.306, blue: 0.306, alpha: 1)]
        )

        setSettingsTextField(textField: &repeatPasswordTextField)
        repeatPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Повторите пароль",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(red: 0.318, green: 0.306, blue: 0.306, alpha: 1)]
        )

        setSettingsButton(button: &registrationButton)
        setSettingsButton(button: &backButton)
    }

    // MARK: - Private func

    @IBAction private func backDidTap(_ sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()

        delegate?.backButtonDidTap()
    }

    @IBAction private func registrationDidTap(_ sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()

        delegate?.registrationButtonDidTap(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
    }

    private func setSettingsTextField(textField: inout UITextField) {
        textField.borderStyle = .none
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
        textField.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }

    private func setSettingsButton(button: inout UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.backgroundColor = UIColor(red: 0.329, green: 0.506, blue: 0.706, alpha: 1)
        button.layer.cornerRadius = 10
    }
}
