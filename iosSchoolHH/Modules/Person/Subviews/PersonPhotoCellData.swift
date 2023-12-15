//
//  PersonCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

struct PersonPhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let image: UIImage

    init(image: UIImage, selectClosure: ( (CoreCellInputData) -> Void)? = nil) {
        self.image = image
        self.selectClosure = selectClosure
    }
}
