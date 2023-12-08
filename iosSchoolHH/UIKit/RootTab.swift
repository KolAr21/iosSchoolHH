//
//  RootTab.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.11.2023.
//

import UIKit

enum RootTab: Int {
    case locations = 0
    case cabinet

    var tabBarItem: UITabBarItem {
        let tabBarItem = UITabBarItem(
            title: title,
            image: image,
            tag: self.rawValue
        )
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "iceberg")
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(named: "black") ?? .black,
            .font: UIFont.systemFont(ofSize: 10)
        ]
        tabBarItem.standardAppearance = appearance
        return tabBarItem
    }

    private var title: String? {
        switch self {
        case .locations:
            return "Выбор планеты"
        case .cabinet:
            return "Профиль"
        }
    }

    private var image: UIImage? {
        switch self {
        case .locations:
            return UIImage(named: "location")
        case .cabinet:
            return UIImage(named: "cabinet")
        }
    }
}
