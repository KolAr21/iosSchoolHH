//
//  ProfileDateColorCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfileDateColorCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let date: String?
    let color: UIColor?
}
