//
//  CustomCollectionView.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import UIKit

final class CustomCollectionView: UICollectionView {
    init(flowLayout: UICollectionViewLayout){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: flowLayout)
        collectionViewLayout = flowLayout
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
