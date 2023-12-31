//
//  AuthView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

protocol AuthView: UIView {
    var delegate: AuthViewDelegate? { get set }

    func setView()
}

protocol AuthViewDelegate: AnyObject {
    func loginButtonDidTap(login: String, password: String)
    func registrationButtonDidTap()
}

final class AuthViewImp: UIView, AuthView {
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var labelView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    @IBOutlet private var loginTextField: CustomTextField!
    @IBOutlet private var passwordTextField: CustomTextField!
    @IBOutlet private var eyeButton: UIButton!
    @IBOutlet private var loginButton: CustomButton!
    @IBOutlet private var registrationButton: CustomButton!

    weak var delegate: AuthViewDelegate?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setView() {
        isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        addGestureRecognizer(recognizer)

        imageView.image = UIImage(named: "auth-background")
        imageView.backgroundColor = UIColor(named: "silver")
        imageView.contentMode = .scaleAspectFill

        labelView.clipsToBounds = false
        labelView.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        labelView.layer.shadowOpacity = 1
        labelView.layer.shadowRadius = 10
        labelView.layer.shadowOffset = CGSize(width: 0, height: 8)
        labelView.backgroundColor = .clear
        labelView.layer.cornerRadius = 10
        labelView.backgroundColor = UIColor(named: "shadow-silver")

        loginTextField.delegate = self
        loginTextField.returnKeyType = .next
        loginTextField.tag = 0
        loginTextField.backgroundColor = UIColor(named: "lightGray")
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Логин",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(named: "matterhorn") ?? .darkGray]
        )

        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .go
        passwordTextField.tag = 1
        passwordTextField.backgroundColor = UIColor(named: "lightGray")
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(named: "matterhorn") ?? .darkGray]
        )

        registrationButton.addTarget(self, action: #selector(registrationDidTap), for: .touchUpInside)

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

    // MARK: - Private methods

    @IBAction private func eyeDidTap(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        if passwordTextField.isSecureTextEntry {
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }

    @IBAction private func loginDidTap(_ sender: UIButton) {
        loginTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        delegate?.loginButtonDidTap(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
    }

    @objc private func registrationDidTap() {
        delegate?.registrationButtonDidTap()
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
    }
}

// MARK: - UITextFieldDelegate

extension AuthViewImp: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            delegate?.loginButtonDidTap(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        }
        return false
    }
}
