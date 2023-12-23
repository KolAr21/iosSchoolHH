//
//  TabBarController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.11.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = UIColor(named: "iceberg")
        tabBar.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 8
    }
}
