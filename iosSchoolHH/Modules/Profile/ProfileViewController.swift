//
//  ProfileViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit
import SPIndicator
import PKHUD

final class ProfileViewController<View: ProfileView>: BaseViewController<View> {
    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    private var onProfileLogout: (() -> Void)?

    init(dataProvider: ProfileDataProvider, storageManager: StorageManager, onProfileLogout: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.storageManager = storageManager
        self.onProfileLogout = onProfileLogout

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.setView()
        HUD.show(.progress)
        let user = storageManager.getUserId()

        if let user {
            dataProvider.profile(userId: user) { [weak self] profile, error in
                guard let self, let profile, error == nil else {
                    DispatchQueue.main.async {
                        HUD.hide()
                        SPIndicator.present(title: "Ошибочка", haptic: .error)
                        self?.update(username: "")
                    }
                    return
                }

                update(username: profile.username)
            }
        } else {
            SPIndicator.present(title: "Ошибочка", haptic: .error)
            HUD.hide()
            update(username: "")
        }
    }

    // MARK: - Private methods

    private func update(username: String) {
        DispatchQueue.main.async {
            HUD.hide()
            self.rootView.update(
                data: .init(
                    image: (UIImage(named: "registration-avatar")) ?? UIImage(),
                    username: username,
                    date: self.storageManager.getDateLastLogin(),
                    color: UIColor(named: "iceberg") ?? UIColor(),
                    logoutClosure: { [weak self] _ in
                        self?.storageManager.removeToken()
                        self?.storageManager.removeUserId()
                        self?.onProfileLogout?()
                    }
                )
            )
        }
    }
}
