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

final class CharacterViewImp: UIView, CharacterView {

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
            ) as? CharacterCell else {
            return
        }
        cell.update(with: data)
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
        section?.cell(collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
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
