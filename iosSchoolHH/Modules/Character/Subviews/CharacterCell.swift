//
//  CharacterCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(167)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(167)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        group.interItemSpacing = .fixed(24)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.contentInsets = NSDirectionalEdgeInsets(top: 60, leading: 16, bottom: 0, trailing: 16)
        return section
    }

    func update(with inputData: CharacterCellData) {
        if inputData.isLoading {
            activityIndicator.startAnimating()
            imageView.image = UIImage(named: "character-placeholder")
        } else {
            activityIndicator.stopAnimating()
            imageView.image = inputData.image
        }
        imageView.layer.cornerRadius = 15
        nameLabel.text = inputData.name
        typeLabel.text = inputData.gender
    }

}
