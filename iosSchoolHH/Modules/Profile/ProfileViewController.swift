//
//  ProfileViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit
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
        dataProvider.profile(userId: storageManager.getUserId() ?? "") { [weak self] profile, _ in
            guard let self, let profile else {
                return
            }
            DispatchQueue.main.async {
                HUD.hide()
                self.rootView.update(
                    data: .init(
                        image: (UIImage(named: "registration-avatar")) ?? UIImage(),
                        username: profile.username,
                        date: self.storageManager.getDateLastLogin(),
                        color: UIColor(named: "iceberg") ?? UIColor(),
                        logoutClosure: {
                            self.storageManager.removeToken()
                            self.onProfileLogout?()
                        }
                    )
                )
            }
        }
    }
}
