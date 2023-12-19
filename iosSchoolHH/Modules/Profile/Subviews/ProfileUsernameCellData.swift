//
//  ProfileUsernameCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfileUsernameCellData: CoreCellInputData {
    let username: String

    var selectClosure: ((CoreCellInputData) -> Void)?
}
