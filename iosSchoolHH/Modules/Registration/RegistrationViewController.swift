//
//  RegistrationViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

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
        registration()
    }

    func registration() {
        let user = User(username: "arina1", password: "12345678")
        dataProvider.registration(user: user) { token, error in
            print(token ?? "no token")
            print(error?.localizedDescription ?? " ")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        onRegistrationSuccess?()
    }
}
