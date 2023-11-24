//
//  RegistrationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit
import SPIndicator
import PKHUD

class RegistrationViewController<View: RegistrationView>: BaseViewController<View> {

    private let dataProvider: RegistrationDataProvider
    private var onRegistrationSuccess: (() -> Void)?

    init(dataProvider: RegistrationDataProvider, onRegistrationSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onRegistrationSuccess = onRegistrationSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.setView()
        rootView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        onRegistrationSuccess?()
    }
}

extension RegistrationViewController: RegistrationViewDelegate {
    func backButtonDidTap() {
        dismiss(animated: true)
    }

    func registrationButtonDidTap(login: String, password: String) {
        HUD.show(.progress)
        let user = User(username: login, password: password)
        dataProvider.registration(user: user) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, token != nil else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.onRegistrationSuccess?()
        }
    }
}
