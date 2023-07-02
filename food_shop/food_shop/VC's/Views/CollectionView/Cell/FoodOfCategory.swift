//
//  FoodOfCategory.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import SnapKit
import UIKit

private extension CGFloat {
    static let offset = 10.0
}

final class FoodOfCategory: UICollectionViewCell {
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
        addSubview(categoryName)
        backgroundColor = Constants.Colors.background_white
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    private func makeConstraints(){
        categoryName.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offset*2)
            make.top.equalToSuperview().offset(CGFloat.offset)
            make.right.equalToSuperview().inset(CGFloat.offset*2)
            make.bottom.equalToSuperview().inset(CGFloat.offset)
        }
    }
    
    func setupCell(name: String){
        categoryName.text = name
    }
}
