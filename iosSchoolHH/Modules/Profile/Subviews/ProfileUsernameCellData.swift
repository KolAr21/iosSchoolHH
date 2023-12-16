//
//  ProfileUsernameCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfileUsernameCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let username: String
}
