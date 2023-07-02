//
//  FoodCategorySingle.swift
//  food_shop
//
//  Created by Nor1 on 02.07.2023.
//

import Foundation
import SnapKit
import UIKit

private extension CGFloat {
    static let titleOffset = 10.0
    static let multipliedBy070 = 0.70
    static let nameSize = 40.0
    static let offsetName = 2.5
}

final class FoodCategorySingle: UICollectionViewCell {
    private lazy var categoryImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var categoryName: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.CategoryScreen.categoryName
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
    }
    private func makeConstraints(){
        categoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat.multipliedBy070)
        }
        categoryName.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(categoryImage.snp.bottom).offset(CGFloat.offsetName)
            make.height.lessThanOrEqualToSuperview()
        }
    }
    
    func setupCell(name: String, image: UIImage){
        categoryImage.image = image
        categoryName.text = name
    }
}
