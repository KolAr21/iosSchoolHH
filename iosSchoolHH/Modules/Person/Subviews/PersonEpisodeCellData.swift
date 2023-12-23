//
//  PersonEpisodeCellData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import Foundation

struct PersonEpisodeCellData: CoreCellInputData {
    let isLoading: Bool
    let number: String
    let name: String?
    let date: String?

    var selectClosure: ((CoreCellInputData) -> Void)?

    init?(url: String) {
        guard let urlEpisode = URL(string: url) else {
            return nil
        }

        isLoading = true
        number = urlEpisode.lastPathComponent
        name = nil
        date = nil
    }

    init(episode: Episode) {
        isLoading = false
        self.number = String(episode.id)
        self.name = episode.name
        self.date = episode.airDate
    }
}
