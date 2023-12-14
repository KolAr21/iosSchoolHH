//
//  PersonEpisodeCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

struct PersonEpisodeCellData: CoreCellInputData {
    var selectClosure: ((CoreCellInputData) -> Void)?

    let number: String

    init? (url: String){
        guard let url = URL(string: url) else {
            return nil
        }
        number = url.lastPathComponent
    }
}
