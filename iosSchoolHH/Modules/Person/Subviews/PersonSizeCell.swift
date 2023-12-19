//
//  spaceCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct PersonSizeCell {
    let screenSize: ScreenSize
    let topSpacePhotoCell: CGFloat = 37

    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static let episodeCell: CGFloat = 127
    static let episodeTopSpaceCell: CGFloat = 9

    private let header: CGFloat = 23
    private let topSpaceHeader: CGFloat = 16
    private let bottomSpaceHeader: CGFloat = 24
    private let navigationTabBar: CGFloat = 93

    var episodeBottomSpaceCell: CGFloat {
        switch screenSize {
        case .smallSize:
            return 0
        case .bigSize:
            return 50
        }
    }

    var spaceBetweenPhotoAndEpisode: CGFloat {
        PersonSizeCell.screenHeight -
        topSpacePhotoCell -
        photoCell -
        busySpaceEpisode -
        navigationTabBar -
        sizeHome
    }

    var fractionalPhotoCell: Double {
        switch screenSize {
        case .smallSize:
            return 0.5
        case .bigSize:
            return 0.45
        }
    }

    private var sizeHome: CGFloat {
        switch screenSize {
        case .smallSize:
            return 0
        case .bigSize:
            return 34
        }
    }

    private var busySpaceEpisode: CGFloat {
        episodeBottomSpaceCell +
        PersonSizeCell.episodeCell +
        PersonSizeCell.episodeTopSpaceCell +
        bottomSpaceHeader +
        header +
        topSpaceHeader
    }

    private var photoCell: CGFloat {
        PersonSizeCell.screenHeight * fractionalPhotoCell
    }

    enum ScreenSize {
        case smallSize
        case bigSize
    }
}
