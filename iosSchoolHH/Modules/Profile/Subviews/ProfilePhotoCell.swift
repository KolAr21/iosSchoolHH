//
//  ProfilePhotoCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 15.12.2023.
//

import UIKit

final class ProfilePhotoCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var backgroundImage: UIImageView!
    @IBOutlet private weak var avatarImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.image = UIImage(named: "profile-background")

        avatarImage.setSettingsImage()
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
        let avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        avatar.image = inputData.image
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        avatarImage.addSubview(avatar)
    }

}
