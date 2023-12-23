//
//  LocationViewData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.11.2023.
//

import Foundation

struct LocationViewData {
    let cellsData: [LocationCellData]

    init(list: LocationsList) {
        cellsData = list.results.map { LocationCellData(location: $0)}
    }
}
