//
//  BaseNavigationController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.11.2023.
//

import UIKit

final class BaseNavigationController: UINavigationController, UINavigationControllerDelegate,
    UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rectInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        let backButton = UIImage(named: "character-back")?.withAlignmentRectInsets(rectInsets)

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        navigationBarAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]
        navigationBarAppearance.setBackIndicatorImage(backButton, transitionMaskImage: backButton)

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        navigationBar.prefersLargeTitles = false
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor(named: "iceberg")
        navigationBar.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        navigationBar.layer.shadowOpacity = 1
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 10)
        navigationBar.layer.shadowRadius = 5

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
