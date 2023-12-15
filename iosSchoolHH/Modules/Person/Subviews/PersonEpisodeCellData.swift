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
    let name: String
    let date: String

    init? (episode: Episode) {
        number = String(episode.id)
        name = episode.name
        date = episode.airDate
    }
}
