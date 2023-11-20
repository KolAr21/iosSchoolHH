//
//  RegistrationView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

protocol RegistrationView: UIView {
    func setView()
}

class RegistrationViewImp: UIView, RegistrationView {

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var avatarView: UIImageView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var repeatPasswordTextField: UITextField!
    @IBOutlet private var registrationButton: UIButton!
    @IBOutlet private var backButton: UIButton!

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {

        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        addGestureRecognizer(recognizer)

        imageView.image = UIImage(named: "registration-background")
        imageView.contentMode = .scaleAspectFill

        avatarView.clipsToBounds = false
        avatarView.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
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
                [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder-darkGray") ?? .darkGray]
        )

        setSettingsTextField(textField: &passwordTextField)
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Введите пароль",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder-darkGray") ?? .darkGray]
        )

        setSettingsTextField(textField: &repeatPasswordTextField)
        repeatPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Повторите пароль",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder-darkGray") ?? .darkGray]
        )

        setSettingsButton(button: &registrationButton)
        setSettingsButton(button: &backButton)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    // MARK: - Private

    private func setSettingsTextField(textField: inout UITextField) {
        textField.borderStyle = .none
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "border-black")?.cgColor
        textField.layer.cornerRadius = 15
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 8
        textField.layer.shadowOffset = CGSize(width: 0, height: 5)
        textField.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }

    private func setSettingsButton(button: inout UIButton) {
        button.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 8
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.backgroundColor = UIColor(named: "button-blue")
        button.layer.cornerRadius = 10
    }

    @IBAction private func registrationDidTap(_ sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }

    @IBAction private func backDidTap(_ sender: UIButton) {}

    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }

    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc private func viewDidTap() {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
}
