//
//  ProfileLogoutCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 16.12.2023.
//

import UIKit

final class ProfileLogoutCell: UICollectionViewCell, CoreCellView {
    override func awakeFromNib() {
        super.awakeFromNib()

        clipsToBounds = false
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 5)
        backgroundColor = UIColor(named: "blue")
        layer.cornerRadius = 10
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let sizeCell = ProfileSizeCell(screenSize: (PersonSizeCell.screenHeight > 800 ? .bigSize : .smallSize))
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(sizeCell.button)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: sizeCell.buttonBottomSpaceCell,
            trailing: 16
        )
        return section
    }

    func update(with inputData: ProfileLogoutCellData) {}
}
