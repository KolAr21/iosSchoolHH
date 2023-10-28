//
//  LocationList.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

struct LocationsList {
    struct Info {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [Location]
}
