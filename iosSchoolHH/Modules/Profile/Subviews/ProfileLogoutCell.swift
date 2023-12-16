//
//  ProfileLogoutCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 16.12.2023.
//

import UIKit

final class ProfileLogoutCell: UICollectionViewCell, CoreCellView {

    @IBOutlet private weak var logoutButton: UIButton!
    private var logout: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        logoutButton.titleLabel?.text = "Выйти"
        logoutButton.setSettingsButton()
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
            leading: 0,
            bottom: sizeCell.buttonBottomSpaceCell,
            trailing: 0
        )
        return section
    }

    func update(with inputData: ProfileLogoutCellData) {
        logout = inputData.logoutClosure
    }

    // MARK: - Private methods

    @IBAction private func logoutDidTap() {
        logout?()
    }
}
