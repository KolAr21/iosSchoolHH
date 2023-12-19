//
//  ProfilePhotoCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

final class ProfilePhotoCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var avatarShadowView: UIView!
    @IBOutlet private weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundImage.image = UIImage(named: "profile-background")

        avatarShadowView.clipsToBounds = false
        avatarShadowView.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        avatarShadowView.layer.shadowOffset = CGSize(width: 0, height: 5)
        avatarShadowView.layer.shadowOpacity = 1
        avatarShadowView.layer.shadowRadius = 4
        avatarShadowView.backgroundColor = .black
        avatarShadowView.layer.cornerRadius = avatarShadowView.frame.width / 2

        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
        avatarImage.layer.masksToBounds = true
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
            heightDimension: .fractionalHeight(sizeCell.fractionalPhotoCell)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: ProfilePhotoCellData) {
        avatarImage.image = inputData.image
    }
}
