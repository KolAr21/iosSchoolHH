//
//  PersonHeaderView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.12.2023.
//

import UIKit

final class PersonHeaderView: UICollectionReusableView, CoreReusableView {
    typealias InputData = PersonHeaderViewData

    @IBOutlet private weak var titleLabel: UILabel!

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem? {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(55)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return header
    }

    func update(with inputData: PersonHeaderViewData) -> Self {
        titleLabel.text = inputData.title
        return self
    }
}
