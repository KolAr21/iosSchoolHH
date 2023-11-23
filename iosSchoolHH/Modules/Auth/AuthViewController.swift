//
//  AuthViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit
import SPIndicator
import PKHUD

class AuthViewController<View: AuthView>: BaseViewController<View> {

    private let dataProvider: AuthDataProvider
    private var onOpenLogin: (() -> Void)?
    var onOpenRegistration: (() -> Void)?

    init(dataProvider: AuthDataProvider, onOpenLogin: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onOpenLogin = onOpenLogin

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
}

// MARK: - AuthViewDelegate

extension AuthViewController: AuthViewDelegate {
    func loginButtonDidTap(login: String, password: String) {
        HUD.show(.progress)
        dataProvider.auth(login: login, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                HUD.hide()
            }
            guard let self, token != nil else {
                DispatchQueue.main.async {
                    SPIndicator.present(title: error?.rawValue ?? "", haptic: .error)
                }
                return
            }
            self.onOpenLogin?()
        }
    }

    func registrationButtonDidTap() {
        onOpenRegistration?()
    }
}
