//
//  UICollectionViewLayout.swift
//  UserStories
//
//  Created by Kyrylo Chernov on 19.03.2025.
//

import UIKit

public extension UICollectionViewLayout {
    static func composed() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return titledTopItemsSection()
        }
    }
    
    private static func titledTopItemsSection() -> NSCollectionLayoutSection {
        let topNestedItemLeading = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        topNestedItemLeading.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 0, trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(60), heightDimension: .absolute(50)), subitems: [topNestedItemLeading])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}
