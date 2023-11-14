//
//  AuthViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

class AuthViewController: UIViewController {

    private let dataProvider: AuthDataProvider
    private var onAuthSuccess: (() -> Void)?

    init(dataProvider: AuthDataProvider, onAuthSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onAuthSuccess = onAuthSuccess
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        login()

        view.backgroundColor = .red
    }

    func login() {
        print("##################LOGIN##################")
        dataProvider.auth(login: "arina1", password: "12345678") { token, error in
            print(token ?? "no token")
            print(error?.localizedDescription ?? " ")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.onAuthSuccess?()
            timer.invalidate()
        }
    }
}
