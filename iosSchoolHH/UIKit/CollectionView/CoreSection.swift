//
//  CoreSection.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

protocol CoreSection: AnyObject {

    var sectionLayoutProvider: UICollectionViewCompositionalLayoutSectionProvider? { get }
    var numberOfItem: Int { get }
    var isContainsHeader: Bool { get }
    var isContainsFooter: Bool { get }

    func registrate(collectionView: UICollectionView)
    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell?
    func reusableView(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        kind: String
    ) -> UICollectionReusableView?
    func selectCell(at index: Int)
    func updateCell(at path: IndexPath, with data: CoreCellInputData)
}
