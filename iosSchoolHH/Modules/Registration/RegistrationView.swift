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

final class RegistrationViewImp: UIView, RegistrationView {
    weak var delegate: RegistrationViewDelegate?

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var avatarView: UIImageView!
    @IBOutlet private var loginTextField: CustomTextField!
    @IBOutlet private var passwordTextField: CustomTextField!
    @IBOutlet private var repeatPasswordTextField: CustomTextField!
    @IBOutlet private var registrationButton: CustomButton!
    @IBOutlet private var backButton: CustomButton!

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
        avatarView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        avatarView.layer.shadowRadius = 8
        avatarView.layer.shadowOffset = CGSize(width: 0, height: 5)
        avatarView.layer.shadowOpacity = 1
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        avatar.image = UIImage(named: "registration-avatar")
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        avatarView.addSubview(avatar)

        loginTextField.setSettingsTextField(placeholder: "Введите логин")
        passwordTextField.setSettingsTextField(placeholder: "Введите пароль")
        repeatPasswordTextField.setSettingsTextField(placeholder: "Повторите пароль")

        registrationButton.setSettingsButton()
        backButton.setSettingsButton()

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

    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
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
