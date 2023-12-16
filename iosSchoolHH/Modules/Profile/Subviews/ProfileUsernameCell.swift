//
//  ProfileUsernameCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

final class ProfileUsernameCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var usernameLabel: UILabel!

    static func layoutSection() -> NSCollectionLayoutSection {

        let sizeCell = ProfileSizeCell(screenSize: (PersonSizeCell.screenHeight > 800 ? .bigSize : .smallSize))

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(sizeCell.label)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: sizeCell.spaces * 0.33, trailing: 0)
        return section
    }

    func update(with inputData: ProfileUsernameCellData) {
        usernameLabel.text = inputData.username
    }

}
