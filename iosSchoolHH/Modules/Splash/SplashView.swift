//
//  SplashView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.11.2023.
//

import UIKit

protocol SplashView: UIView {
    func setView()
}

final class SplashViewImp: UIView, SplashView {
    func setView() {
        self.backgroundColor = UIColor(named: "iceberg")
    }
}
