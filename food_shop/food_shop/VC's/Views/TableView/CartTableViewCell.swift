//
//  CartTableViewCell.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import UIKit

private extension CGFloat {
    static let cornerRaius = 10.0
    static let imageOffset = 10.0
    static let imageOffsetLeft = 15.0
    static let textOffset = 10.0
    static let textOffset5 = 3.0
    static let multipliedByConButtons = 0.3
    static let multipliedByConButtonsHeight = 0.4
    static let minHeight = 60.0
    static let buttonOffset = 15.0
}

final class CartTableViewCell: UITableViewCell {
    
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = CGFloat.cornerRaius
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var containerText: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var containerButtons: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var foodName: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.CartScreen.foodName
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    private lazy var foodCost: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.CartScreen.foodCost
        return view
    }()
    private lazy var foodWeight: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.CartScreen.foodCost
        view.textColor = Constants.Colors.light_gray
        return view
    }()
    private lazy var buttons: CartButtons = {
        let view = CartButtons(selectorPlus: #selector(plusPressed), selectorMinus: #selector(minusPressed))
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setuViews()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setuViews(){
        addSubview(foodImage)
        addSubview(containerText)
        addSubview(containerButtons)
        containerText.addSubview(foodName)
        containerText.addSubview(foodCost)
        containerText.addSubview(foodWeight)
        containerButtons.addSubview(buttons)
    }
    private func makeConstraints(){
        foodImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.imageOffsetLeft)
            make.top.equalToSuperview().offset(CGFloat.imageOffset)
            make.bottom.equalToSuperview().inset(CGFloat.imageOffset)
            make.width.equalTo(foodImage.snp.height)
        }
        containerButtons.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(CGFloat.buttonOffset)
            make.width.equalToSuperview().multipliedBy(CGFloat.multipliedByConButtons)
            make.height.equalToSuperview().multipliedBy(CGFloat.multipliedByConButtonsHeight)
            make.centerY.equalToSuperview()
        }
        containerText.snp.makeConstraints { make in
            make.left.equalTo(foodImage.snp.right).offset(CGFloat.textOffset)
            make.right.lessThanOrEqualTo(containerButtons.snp.left)
            make.height.greaterThanOrEqualTo(CGFloat.minHeight)
            make.centerY.equalToSuperview()
        }
        foodName.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        foodCost.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom).offset(CGFloat.textOffset5)
            make.left.equalToSuperview()
        }
        foodWeight.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom).offset(CGFloat.textOffset5)
            make.left.equalTo(foodCost.snp.right).offset(CGFloat.textOffset)
        }
        buttons.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    @objc private func plusPressed(){
        print("plus")
    }
    @objc private func minusPressed(){
        print("minus")
    }
    func setupCell(model: TestModelCart){
        foodImage.image = model.image
        foodName.text = model.name
        foodCost.text = String(model.price) + " Р"
        foodWeight.text = String(model.weight) + "г"
    }
}
