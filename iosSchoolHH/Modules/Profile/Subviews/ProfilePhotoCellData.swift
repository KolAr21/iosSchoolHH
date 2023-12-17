//
//  ProfilePhotoCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfilePhotoCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let image: UIImage

    init(image: UIImage?) {
        self.image = image ?? UIImage()
    }
}
