//
//  LocationList.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 23.10.2023.
//

import Foundation

struct LocationsList {
    var info: Info
    var results: [Location]

    struct Info {
        var count: Int
        var pages: Int
        var next: String?
        var prev: String?
    }
}
