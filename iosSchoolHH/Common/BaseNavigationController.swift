//
//  BaseNavigationController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.11.2023.
//

import UIKit

class BaseNavigationController: UINavigationController, UINavigationControllerDelegate,
    UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg")
        view.backgroundColor = UIColor(named: "iceberg")
    }

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    // MARK: - UIGestureRecognizerDelegate

    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
