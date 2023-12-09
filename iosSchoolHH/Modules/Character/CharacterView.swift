//
//  CharacterView.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 07.12.2023.
//

import UIKit

protocol CharacterView: UIView {
    func setView()
    func update(data: CharacterViewData)
    func updateCharacter(idx: Int, with data: CharacterCellData)
}

class CharacterViewImp: UIView, CharacterView {

    private var section: CoreSection?

    private lazy var collectionView: UICollectionView = {
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout()
        )
    }()

    func setView() {
        self.backgroundColor = UIColor(named: "silver")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    // MARK: - Private methods

    private func layout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [unowned self] section, env -> NSCollectionLayoutSection? in
            guard let charactersSection = self.section else {
                return nil
            }

            guard let layoutSection = charactersSection.sectionLayoutProvider?(section, env) else {
                return nil
            }
            return layoutSection
        }
    }

    func update(data: CharacterViewData) {
        section = CharactersSection(cellsData: data.cells)
        section?.registrate(collectionView: collectionView)
        collectionView.reloadData()
    }

    func updateCharacter(idx: Int, with data: CharacterCellData) {
        section?.updateCell(at: IndexPath(item: idx, section: 0), with: data)
        guard let cell = section?.cell(
            collectionView: collectionView,
            indexPath: IndexPath(item: idx, section: 0)
        ) as? CharacterCell else { return }
    }
}

// MARK: - UICollectionViewDataSource

extension CharacterViewImp: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section?.numberOfItem ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = section?.cell(collectionView: collectionView, indexPath: indexPath) else {
            return UICollectionViewCell()
        }

        cell.backgroundColor = UIColor(named: "iceberg")
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = false
        cell.layer.shadowColor = UIColor(named: "shadow-black")?.cgColor
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowRadius = 8

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CharacterViewImp: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        section?.selectCell(at: indexPath.row)
    }

}

private extension CharacterViewImp {
    typealias CharactersSection = Section<CharacterCell, EmptyReusableView, EmptyReusableView>
}
