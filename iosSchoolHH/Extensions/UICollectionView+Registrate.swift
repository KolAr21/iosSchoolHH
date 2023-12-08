//
//  UICollectionView+Registrate.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

extension UICollectionView {
    func reusableViewId<View>(viewType: View.Type) -> String {
        String(describing: viewType)
    }

    func registerCell<Cell: UICollectionViewCell & CoreNibReusable>(cellType: Cell.Type) {
        let identifier = reusableViewId(viewType: cellType)
        if let nib = Cell.nib {
            register(nib, forCellWithReuseIdentifier: identifier)
        } else {
            register(cellType, forCellWithReuseIdentifier: identifier)
        }
    }

    func registerHeader<Header: UICollectionReusableView & CoreNibReusable>(viewType: Header.Type) {
        let identifier = reusableViewId(viewType: viewType)
        if let nib = Header.nib {
            register(
                nib,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: identifier
            )
        } else {
            register(
                viewType,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: identifier
            )
        }
    }

    func registerFooter<Footer: UICollectionReusableView & CoreNibReusable>(viewType: Footer.Type) {
        let identifier = reusableViewId(viewType: viewType)
        if let nib = Footer.nib {
            register(
                nib,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: identifier
            )
        } else {
            register(
                viewType,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: identifier
            )
        }
    }
}
