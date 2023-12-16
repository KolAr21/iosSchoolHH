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

    init(image: UIImage?, episodesUrls: [String]) {
        self.photoCellData = PersonPhotoCellData(image: image ?? UIImage())
        self.episodeData = episodesUrls.compactMap { PersonEpisodeCellData(url: $0) }
        episodeHeader = PersonHeaderViewData()
    }
}
