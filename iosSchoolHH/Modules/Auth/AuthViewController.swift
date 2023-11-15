//
//  AuthViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 06.11.2023.
//

import UIKit

class AuthViewController: UIViewController {

    private let dataProvider: AuthDataProvider

    init(dataProvider: AuthDataProvider) {
        self.dataProvider = dataProvider
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
}
