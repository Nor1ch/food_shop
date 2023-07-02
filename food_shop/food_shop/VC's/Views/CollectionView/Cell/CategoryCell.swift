//
//  CategoryCell.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit

private extension CGFloat {
    static let titleOffset = 10.0
    static let multipliedBy050 = 0.50
    static let multipliedBy030 = 0.30
}

final class CategoryCell: UICollectionViewCell {
    private lazy var categoryImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var categoryName: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.MainScreen.categoryName
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(categoryImage)
        addSubview(categoryName)
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    private func makeConstraints(){
        categoryImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        categoryName.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.titleOffset)
            make.top.equalToSuperview().offset(CGFloat.titleOffset)
            make.width.equalToSuperview().multipliedBy(CGFloat.multipliedBy050)
            make.height.greaterThanOrEqualToSuperview().multipliedBy(CGFloat.multipliedBy030)
        }
    }
    
    func setupCell(name: String, image: UIImage){
        categoryImage.image = image
        categoryName.text = name
    }
}
