//
//  ProfileDateColorCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

final class ProfileDateColorCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var textField: CustomTextField!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        textField.isUserInteractionEnabled = false

        colorView.layer.cornerRadius = 10
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let sizeCell = ProfileSizeCell(screenSize: (PersonSizeCell.screenHeight > 800 ? .bigSize : .smallSize))
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(sizeCell.textFieldCells)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 2
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: sizeCell.spaces * 0.66, trailing: 0)
        return section
    }

    func update(with inputData: ProfileDateColorCellData) {
        if let color = inputData.color {
            textField.attributedPlaceholder = NSAttributedString(
                string: "Цвет профиля",
                attributes:
                    [NSAttributedString.Key.foregroundColor: UIColor(named: "matterhorn") ?? .darkGray]
            )
            dateLabel.isHidden = true
            colorView.isHidden = false
            colorView.backgroundColor = color
        } else {
            textField.attributedPlaceholder = NSAttributedString(
                string: "Дата входа",
                attributes:
                    [NSAttributedString.Key.foregroundColor: UIColor(named: "matterhorn") ?? .darkGray]
            )
            dateLabel.isHidden = false
            dateLabel.text = inputData.date ?? ".. .. ...."
            colorView.isHidden = true
        }
    }
}
