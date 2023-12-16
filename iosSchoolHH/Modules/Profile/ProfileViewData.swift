//
//  ProfileViewData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 09.12.2023.
//

import UIKit

struct ProfileViewData {
    let photoCellData: ProfilePhotoCellData
    let usernameCellData: ProfileUsernameCellData
    let dateColorCellData: [ProfileDateColorCellData]
    let logoutCellData: ProfileLogoutCellData

    init(image: UIImage?, username: String, date: String, color: UIColor, logoutClosure: @escaping () -> Void) {
        self.photoCellData = ProfilePhotoCellData(image: image ?? UIImage())
        self.usernameCellData = ProfileUsernameCellData(username: username)
        self.dateColorCellData = [
            ProfileDateColorCellData(date: date, color: nil),
            ProfileDateColorCellData(date: nil, color: color)
        ]
        self.logoutCellData = ProfileLogoutCellData(logoutClosure: logoutClosure)
    }

}
