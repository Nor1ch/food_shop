//
//  CartButtons.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import SnapKit
import UIKit

private extension CGFloat {
    static let cornerRadius = 15.0
    static let multipliedBy033 = 0.33
    static let offset = 5.0
}

final class CartButtons: UIView {
    
    private lazy var plusButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.background.cornerRadius = CGFloat.cornerRadius
        config.cornerStyle = .fixed
        config.image = Constants.Images.plus
        view.configuration = config
        return view
    }()
    private lazy var minusButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.background.cornerRadius = CGFloat.cornerRadius
        config.cornerStyle = .fixed
        config.image = Constants.Images.minus
        view.configuration = config
        return view
    }()
    private lazy var spacer: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.gray_buttons
        view.layer.cornerRadius = CGFloat.cornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    lazy var counter: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.CartScreen.counter
        view.text = "1"
        return view
    }()
    
    init(selectorPlus: Selector, selectorMinus: Selector){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        plusButton.addTarget(self, action: selectorPlus, for: .touchUpInside)
        minusButton.addTarget(self, action: selectorMinus, for: .touchUpInside)
        setupViews()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(spacer)
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(counter)
    }
    private func makeConstraints(){
        minusButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(CGFloat.multipliedBy033)
        }
        spacer.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        plusButton.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(CGFloat.multipliedBy033)
        }
        counter.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
}
