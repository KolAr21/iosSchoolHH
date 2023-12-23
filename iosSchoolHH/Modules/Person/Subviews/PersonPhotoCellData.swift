//
//  PersonCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

struct PersonPhotoCellData: CoreCellInputData {
    let image: UIImage

    var selectClosure: ((CoreCellInputData) -> Void)?
}
