//
//  CharacterFindCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.12.2023.
//

import Foundation

struct CharacterFindCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?
    var delegate: CharacterViewControllerDelegate
}
