//
//  Episode.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
    }
}
