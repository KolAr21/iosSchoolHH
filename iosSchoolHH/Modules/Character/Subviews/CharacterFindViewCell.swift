//
//  CharacterFindViewCell.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 27.12.2023.
//

import UIKit

class CharacterFindViewCell: UICollectionViewCell, CoreCellView {
    @IBOutlet private weak var search: UISearchBar!
    weak var delegate: CharacterViewControllerDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        search.delegate = self
        search.searchTextField.borderStyle = .none
        search.clipsToBounds = true
        search.layer.borderWidth = 1
        search.layer.borderColor = UIColor(named: "black")?.cgColor
        search.layer.cornerRadius = 15
    }

    static func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(62)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    func update(with inputData: CharacterFindCellData) {
        delegate = inputData.delegate
    }
}

extension CharacterFindViewCell: UISearchBarDelegate, UISearchDisplayDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.searchCharacter(name: searchBar.text ?? "")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            delegate?.showAllCharacters()
        }
    }
}
