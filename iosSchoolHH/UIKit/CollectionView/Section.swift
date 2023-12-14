//
//  Section.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

class Section<Cell: CoreCellView, Header: CoreReusableView, Footer: CoreReusableView>: CoreSection {

    lazy var sectionLayoutProvider: UICollectionViewCompositionalLayoutSectionProvider? = {
        let sectionLayoutProvider: UICollectionViewCompositionalLayoutSectionProvider
        sectionLayoutProvider = { [unowned self] _, env -> NSCollectionLayoutSection? in
            self.layoutSection(env: env)
        }
        return sectionLayoutProvider
    }()
    var numberOfItem: Int {
        cellsData.count
    }
    var isContainsHeader: Bool {
        headerData != nil
    }
    var isContainsFooter: Bool {
        footerData != nil
    }

    var headerData: Header.InputData?
    var footerData: Footer.InputData?
    var cellsData: [Cell.InputData]
    private weak var collectionView: UICollectionView?

    init(
        cellsData: [Cell.InputData],
        headerData: Header.InputData? = nil,
        footerData: Footer.InputData? = nil,
        sectionLayoutProvider: UICollectionViewCompositionalLayoutSectionProvider? = nil
    ) {
        self.cellsData = cellsData
        self.headerData = headerData
        self.footerData = footerData

        if let sectionLayoutProvider = sectionLayoutProvider {
            self.sectionLayoutProvider = sectionLayoutProvider
        }
    }

    func registrate(collectionView: UICollectionView) {
        self.collectionView = collectionView

        collectionView.registerCell(cellType: Cell.self)
        collectionView.registerHeader(viewType: Header.self)
        collectionView.registerFooter(viewType: Footer.self)
    }

    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: Cell.self),
            for: indexPath
        )
        let cellData = cellsData[indexPath.row]
        if let cell = cell as? Cell {
            cell.update(with: cellData)
        }
        return cell
    }

    func reusableView(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        kind: String
    ) -> UICollectionReusableView? {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerData = headerData else {
                return nil
            }
            return (collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: Header.self),
                for: indexPath
            ) as? Header)?
                .update(with: headerData)
        case UICollectionView.elementKindSectionFooter:
            guard let footerData = footerData else {
                return nil
            }
            return (collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: String(describing: Footer.self),
                for: indexPath
            ) as? Footer)?
                .update(with: footerData)
        default:
            return nil
        }
    }

    func selectCell(at index: Int) {
        cellsData[index].selectClosure?(cellsData[index])
    }

    func updateCell(at path: IndexPath, with data: CoreCellInputData) {
        guard let data = data as? Cell.InputData else {
            return
        }
        cellsData[path.row] = data
        collectionView?.reloadItems(at: [path])

    }
}

// MARK: - Items layout

private extension Section {
    func layoutSection(env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        guard !cellsData.isEmpty else {
            return nil
        }
        let layout = Cell.layoutSection()
        layout.boundarySupplementaryItems = [headerItem(env: env), footerItem(env: env)].compactMap { $0 }
        return Cell.layoutSection()
            .add(supplementaryItem: headerItem(env: env))
            .add(supplementaryItem: footerItem(env: env))
    }

    func headerItem(env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutBoundarySupplementaryItem? {
        guard headerData != nil else {
            return nil
        }
        return Header.layoutItem()
    }

    func footerItem(env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutBoundarySupplementaryItem? {
        guard footerData != nil else {
            return nil
        }
        return Footer.layoutItem()
    }
}
