//
//  PersonPhotoCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

class PersonPhotoCell: UICollectionViewCell, CoreCellView {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(named: "iceberg")
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 37, leading: 16, bottom: 84, trailing: 16)
        return section

    }

    func update(with inputData: PersonPhotoCellData) {

    }

}
