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

    init(
        image: UIImage?,
        username: String,
        date: String,
        color: UIColor,
        colorClosure: @escaping (CoreCellInputData) -> Void,
        logoutClosure: @escaping (CoreCellInputData) -> Void
    ) {
        photoCellData = ProfilePhotoCellData(image: image)
        usernameCellData = ProfileUsernameCellData(username: username)
        dateColorCellData = [
            ProfileDateColorCellData(date: date, color: nil),
            ProfileDateColorCellData(date: nil, color: color, selectClosure: colorClosure)
        ]
        logoutCellData = ProfileLogoutCellData(selectClosure: logoutClosure)
    }
}
