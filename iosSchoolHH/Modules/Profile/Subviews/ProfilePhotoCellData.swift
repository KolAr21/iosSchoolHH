//
//  ProfilePhotoCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfilePhotoCellData: CoreCellInputData {
    let image: UIImage

    var selectClosure: ((CoreCellInputData) -> Void)?

    init(image: UIImage?) {
        self.image = image ?? UIImage()
    }
}
