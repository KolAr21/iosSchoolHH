//
//  ProfileDateColorCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfileDateColorCellData: CoreCellInputData {
    let date: String?
    let color: UIColor?

    var selectClosure: ((CoreCellInputData) -> Void)?
}
