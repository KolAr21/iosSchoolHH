//
//  PersonViewData.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

struct PersonViewData {
    let photoCellData: PersonPhotoCellData
    let episodeData: [PersonEpisodeCellData]
    let episodeHeader: PersonHeaderViewData

    init(image: UIImage?, episodes: [Episode]) {
        self.photoCellData = PersonPhotoCellData(image: image ?? UIImage())
        self.episodeData = episodes.compactMap { PersonEpisodeCellData(episode: $0) }
        episodeHeader = PersonHeaderViewData()
    }
}
