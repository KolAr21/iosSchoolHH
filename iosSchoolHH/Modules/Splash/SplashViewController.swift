//
//  SplashViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

final class SplashViewController<View: SplashView>: BaseViewController<View> {
    private let onSuccess: (() -> Void)?

    init(onSuccess: (() -> Void)?) {
        self.onSuccess = onSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.onSuccess?()
            timer.invalidate()
        }
    }
}
