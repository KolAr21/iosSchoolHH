//
//  ProfileLogoutCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 16.12.2023.
//

import Foundation

struct ProfileLogoutCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    let logoutClosure: () -> Void
}
