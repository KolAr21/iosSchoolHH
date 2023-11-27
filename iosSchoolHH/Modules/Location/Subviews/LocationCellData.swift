//
//  LocationCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.11.2023.
//

import Foundation

struct LocationCellData {
    let name: String
    let type: String
    let population: Int

    init(location: Location) {
        name = location.name
        type = location.type
        population = location.residents.count
    }
}
