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
    static let offsetName = 5
    static let cornerRadius = 10.0
    static let offset15 = 15.0
    static let offset10 = 10.0
}

final class FoodCategorySingle: UICollectionViewCell {
    private lazy var categoryImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = CGFloat.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var backgroundImageView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.background_white
        view.layer.cornerRadius = CGFloat.cornerRadius
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
        addSubview(backgroundImageView)
        addSubview(categoryName)
        backgroundImageView.addSubview(categoryImage)
    }
    private func makeConstraints(){
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat.multipliedBy070)
        }
        categoryName.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(5)
            make.top.equalTo(backgroundImageView.snp.bottom).offset(CGFloat.offsetName)
            make.height.lessThanOrEqualToSuperview()
        }
        categoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.offset15)
            make.left.equalToSuperview().offset(CGFloat.offset15)
            make.right.equalToSuperview().inset(CGFloat.offset10)
            make.bottom.equalToSuperview().inset(CGFloat.offset10)
        }
    }
    
    func setupCell(name: String, image: UIImage){
        categoryImage.image = image
        categoryName.text = name
    }
}
