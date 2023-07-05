//
//  FlowLayout.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import UIKit

private extension CGFloat {
    static let offset = 10.0
    static let offset15 = 15.0
    static let offset5 = 2.5
    static let estimatedMax = 10000.0
    static let estimatedTag = 300.0
    static let absoluteHeight = 40.0
    static let fractional03 = 0.3
    static let fractional022 = 0.22
    static let fractional1 = 1.0
    
}
extension UICollectionViewFlowLayout {
    static func singleItemInRow() -> UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = .init(width: UIScreen.main.bounds.width - CGFloat.offset15*2, height: UIScreen.main.bounds.height/5)
        flow.sectionInset = .init(top: CGFloat.offset15, left: CGFloat.offset15, bottom: CGFloat.offset, right: CGFloat.offset15)
        return flow
    }
    static func detailsWithSection() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout()
    }
}

extension UICollectionViewCompositionalLayout {
    static func layoutWithTags() -> UICollectionViewCompositionalLayout {
        let flow = UICollectionViewCompositionalLayout { (sectionNum, env) -> NSCollectionLayoutSection? in
            switch sectionNum{
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(CGFloat.estimatedTag), heightDimension: .absolute(CGFloat.absoluteHeight)))
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(CGFloat.offset), top: .fixed(0), trailing: .fixed(CGFloat.offset), bottom: .fixed(0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(CGFloat.estimatedMax), heightDimension: .absolute(CGFloat.absoluteHeight)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = CGFloat.offset
                section.contentInsets.top = CGFloat.offset
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(.fractional03), heightDimension: .fractionalHeight(.fractional1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(.fractional1), heightDimension: .fractionalHeight(.fractional022)), subitems: [item])
                group.interItemSpacing = .fixed(10)
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(5))
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets.leading = CGFloat.offset*2
                section.contentInsets.top = CGFloat.offset*2
                return section
            }
        }
        return flow
    }
}
