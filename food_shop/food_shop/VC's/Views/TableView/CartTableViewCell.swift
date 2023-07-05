//
//  CartTableViewCell.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import UIKit

protocol CartTableViewDelegate: AnyObject {
    func plusPressed(index: IndexPath)
    func minusPressed(index: IndexPath)
}

private extension CGFloat {
    static let cornerRaius = 10.0
    static let offset = 10.0
    static let offsetLeft = 15.0
    static let offsetImage = 12.0
    static let textOffset = 10.0
    static let textOffset5 = 3.0
    static let multipliedByConButtons = 0.3
    static let multipliedByConButtonsHeight = 0.4
    static let minHeight = 60.0
    static let buttonOffset = 15.0
}

final class CartTableViewCell: UITableViewCell {
    
    private var food: CartModel?
    weak var delegate: CartTableViewDelegate?
    var index: IndexPath?
    
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = CGFloat.cornerRaius
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var containerImage: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.background_white
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
        let view = CartButtons()
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    private func setuViews(){
        contentView.addSubview(containerImage)
        contentView.addSubview(containerText)
        contentView.addSubview(containerButtons)
        containerImage.addSubview(foodImage)
        containerText.addSubview(foodName)
        containerText.addSubview(foodCost)
        containerText.addSubview(foodWeight)
        containerButtons.addSubview(buttons)
        buttons.plusButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)
        buttons.minusButton.addTarget(self, action: #selector(minusPressed), for: .touchUpInside)
    }
    private func makeConstraints(){
        containerImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offsetLeft)
            make.top.equalToSuperview().offset(CGFloat.offset)
            make.bottom.equalToSuperview().inset(CGFloat.offset)
            make.width.equalTo(containerImage.snp.height)
        }
        foodImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.offsetImage)
            make.left.equalToSuperview().offset(CGFloat.offsetImage)
            make.right.equalToSuperview().inset(CGFloat.offset)
            make.bottom.equalToSuperview().inset(CGFloat.offset)
        }
        containerButtons.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(CGFloat.buttonOffset)
            make.width.equalToSuperview().multipliedBy(CGFloat.multipliedByConButtons)
            make.height.equalToSuperview().multipliedBy(CGFloat.multipliedByConButtonsHeight)
            make.centerY.equalToSuperview()
        }
        containerText.snp.makeConstraints { make in
            make.left.equalTo(containerImage.snp.right).offset(CGFloat.textOffset)
            make.right.lessThanOrEqualTo(containerButtons.snp.left)
            make.top.equalTo(foodName.snp.top)
            make.bottom.equalTo(foodCost.snp.bottom)
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
        if let delegate = delegate, let index = index {
            delegate.plusPressed(index: index)
        }
    }
    @objc private func minusPressed(){
        if let delegate = delegate, let index = index {
            delegate.minusPressed(index: index)
        }
    }
    func setupCell(model: CartModel){
        self.food = model
        foodImage.image = model.name.image
        foodName.text = model.name.name
        foodCost.text = String(model.name.price) + " ₽"
        foodWeight.text = String(model.name.weight) + "г"
        buttons.counter.text = String(model.count)
    }
}
