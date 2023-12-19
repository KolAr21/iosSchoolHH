//
//  CharacterCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

final class CharacterCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(named: "iceberg")
        layer.cornerRadius = 15
        clipsToBounds = false
        layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 8

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
    }

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
        nameLabel.text = inputData.name
        typeLabel.text = inputData.gender
    }
}
