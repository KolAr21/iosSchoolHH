//
//  PersonEpisodeCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

class PersonEpisodeCell: UICollectionViewCell, CoreCellView {

    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(127),
            heightDimension: .absolute(127)
        )

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 26
        section.contentInsets = NSDirectionalEdgeInsets(top: 18, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func update(with inputData: PersonEpisodeCellData) {
        numberLabel.text = inputData.number
    }

}
