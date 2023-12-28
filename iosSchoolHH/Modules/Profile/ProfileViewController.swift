//
//  ProfileViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit
import SPIndicator
import PKHUD

final class ProfileViewController<View: ProfileView>: BaseViewController<View>, UIColorPickerViewControllerDelegate {
    private let dataProvider: ProfileDataProvider
    private let storageManager: StorageManager

    private var onProfileLogout: (() -> Void)?
    private var username: String?

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
        guard let user = storageManager.getUserId() else {
            showError()
            return
        }
        dataProvider.profile(userId: user) { [weak self] profile, error in
            guard let self, let profile, error == nil else {
                self?.showError()
                return
            }

            username = profile.username
            update(username: profile.username)
        }
    }

    // MARK: - Private methods

    private func showError() {
        DispatchQueue.main.async {
            HUD.hide()
            SPIndicator.present(title: "Ошибочка", haptic: .error)
            self.update(username: "")
        }
    }

    private func update(username: String) {
        DispatchQueue.main.async {
            HUD.hide()
            self.rootView.update(
                data: .init(
                    image: (UIImage(named: "registration-avatar")) ?? UIImage(),
                    username: username,
                    date: self.storageManager.getDateLastLogin(),
                    color: self.storageManager.getColor() ?? UIColor(named: "silver") ?? UIColor(),
                    colorClosure: { [weak self] _ in
                        self?.setColorPicker()
                    },
                    logoutClosure: { [weak self] _ in
                        self?.storageManager.removeToken()
                        self?.storageManager.removeUserId()
                        self?.onProfileLogout?()
                    }
                )
            )
        }
    }

    private func setColorPicker() {
        let picker = UIColorPickerViewController()
        picker.selectedColor = UIColor(named: "silver") ?? UIColor()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        storageManager.saveColor(color: viewController.selectedColor)

        update(username: username ?? "")
    }
}
