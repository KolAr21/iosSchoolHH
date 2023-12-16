//
//  ProfileSizeCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

struct ProfileSizeCell {
    let screenSize: ScreenSize
    let textFieldCells: CGFloat = 116
    let label: CGFloat = 27
    let buttonBottomSpaceCell: CGFloat = 30
    let button: CGFloat = 56

    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    var spaces: CGFloat {
        ProfileSizeCell.screenHeight -
        photoCell -
        label -
        textFieldCells -
        button -
        buttonBottomSpaceCell -
        tabBar
    }

    var fractionalPhotoCell: Double {
        switch screenSize {
        case .smallSize:
            return 0.53
        case .bigSize:
            return 0.47
        }
    }

    private var tabBar: CGFloat {
        switch screenSize {
        case .smallSize:
            return 49
        case .bigSize:
            return 137
        }
    }

    private var photoCell: CGFloat {
        PersonSizeCell.screenHeight * fractionalPhotoCell
    }

    enum ScreenSize {
        case smallSize
        case bigSize
    }
}
