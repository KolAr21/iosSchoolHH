//
//  PersonEpisodeCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

final class PersonEpisodeCell: UICollectionViewCell, CoreCellView {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor(named: "iceberg")
        layer.cornerRadius = 15

        numberView.layer.cornerRadius = 16
        numberView.backgroundColor = UIColor(named: "mint")
        numberView.clipsToBounds = false
        numberView.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        numberView.layer.shadowOpacity = 1
        numberView.layer.shadowOffset = CGSize(width: 0, height: 4)
        numberView.layer.shadowRadius = 4
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let sizeCell = PersonSizeCell(screenSize: (PersonSizeCell.screenHeight > 800 ? .bigSize : .smallSize))
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(PersonSizeCell.episodeCell),
            heightDimension: .absolute(PersonSizeCell.episodeCell)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(PersonSizeCell.episodeCell),
            heightDimension: .absolute(PersonSizeCell.episodeCell)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(
            top: PersonSizeCell.episodeTopSpaceCell,
            leading: 18,
            bottom: sizeCell.episodeBottomSpaceCell,
            trailing: 17
        )
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number

        if !inputData.isLoading {
            nameLabel.text = inputData.name
            dateLabel.text = inputData.date
        } else {
            nameLabel.text = ""
            dateLabel.text = ""
        }
    }
}
