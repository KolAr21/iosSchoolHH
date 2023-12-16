//
//  PersonPhotoCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

final class PersonPhotoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(named: "iceberg")
        clipsToBounds = false
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 8
        layer.cornerRadius = 15

        imageView.layer.cornerRadius = 15
    }

    static func layoutSection() -> NSCollectionLayoutSection {

        let sizeCell = PersonSizeCell(screenSize: (PersonSizeCell.screenHeight > 800 ? .bigSize : .smallSize))

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(sizeCell.fractionalPhotoCell)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: sizeCell.topSpacePhotoCell,
            leading: 16,
            bottom: sizeCell.spaceBetweenPhotoAndEpisode,
            trailing: 16
        )
        return section

    }

    func update(with inputData: PersonPhotoCellData) {
        imageView.image = inputData.image
    }

}
