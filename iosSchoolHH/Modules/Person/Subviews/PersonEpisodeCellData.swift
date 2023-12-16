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
    let isLoading: Bool
    let name: String?
    let date: String?

    init?(url: String) {
        guard let urlEpisode = URL(string: url) else {
            return nil
        }
        number = urlEpisode.lastPathComponent
        isLoading = true
        name = nil
        date = nil
    }

    init(episode: Episode) {
        self.number = String(episode.id)
        isLoading = false
        self.name = episode.name
        self.date = episode.airDate
    }
}
