//
//  DetailsVC.swift
//  food_shop
//
//  Created by Nor1 on 02.07.2023.
//

import Foundation
import UIKit

private extension CGFloat {
    static let buttonSide = 50.0
    static let textHeight = 30.0
    static let offsetSides = 20.0
    static let offset10 = 10.0
    static let offset15 = 15.0
    static let offset7 = 7.0
    static let offset5 = 2.5
    static let multipliedBy01 = 0.1
    static let multipliedBy016 = 0.16
    static let multipliedBy05 = 0.5
    static let multipliedBy06 = 0.6
    static let multipliedBy08 = 0.8
    static let corner10 = 10.0
    static let corner15 = 15.0
    static let alpha = 0.4
    static let sideButton = 42.0
}

final class DetailsVC: UIViewController {
    private let viewModel: DetailViewModel
    private let food: FoodModelCompl
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.black
        view.alpha = CGFloat.alpha
        return view
    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.white
        view.layer.cornerRadius = CGFloat.corner15
        return view
    }()
    private lazy var containerImage: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.background_white
        view.layer.cornerRadius = CGFloat.corner10
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = CGFloat.corner10
        view.layer.masksToBounds = true
        return view
    }()
    private lazy var containerText: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var foodTitle: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.DetailsScreen.foodName
        return view
    }()
    private lazy var foodCost: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.DetailsScreen.foodCost
        return view
    }()
    private lazy var foodWeight: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.DetailsScreen.foodWeight
        view.textColor = Constants.Colors.light_gray
        return view
    }()
    private lazy var foodDescription: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.DetailsScreen.foodDescription
        view.textColor = Constants.Colors.gray
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    private lazy var addButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Colors.blue
        config.background.cornerRadius = CGFloat.corner10
        config.cornerStyle = .fixed
        config.title = "Добавить в корзину"
        view.configuration = config
        view.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        return view
    }()
    private lazy var favButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Colors.white
        config.background.cornerRadius = CGFloat.corner10
        config.cornerStyle = .fixed
        config.image = Constants.Images.favorite
        view.configuration = config
        view.addTarget(self, action: #selector(favTapped), for: .touchUpInside)
        return view
    }()
    private lazy var closeButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Colors.white
        config.background.cornerRadius = CGFloat.corner10
        config.cornerStyle = .fixed
        config.image = Constants.Images.close
        view.configuration = config
        view.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        return view
    }()
    init(viewModel: DetailViewModel, food: FoodModelCompl){
        self.viewModel = viewModel
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        setupInfo()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismiss(animated: true, completion: nil)
    }
    private func setupViews(){
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        containerView.addSubview(containerImage)
        containerView.addSubview(containerText)
//        containerText.addSubview(addButton)
        containerView.addSubview(addButton)
        containerImage.addSubview(foodImage)
        containerImage.addSubview(favButton)
        containerImage.addSubview(closeButton)
        containerText.addSubview(foodTitle)
        containerText.addSubview(foodCost)
        containerText.addSubview(foodWeight)
        containerText.addSubview(foodDescription)
    }
    private func makeConstraints(){
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offsetSides)
            make.right.equalToSuperview().inset(CGFloat.offsetSides)
//            make.top.equalTo(containerImage.snp.top)
            make.bottom.equalTo(addButton.snp.bottom).offset(15)
            make.centerY.equalToSuperview()
        }
        containerImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.offsetSides)
            make.right.equalToSuperview().inset(CGFloat.offsetSides)
            make.left.equalToSuperview().offset(CGFloat.offsetSides)
            make.height.equalTo(containerImage.snp.width).multipliedBy(CGFloat.multipliedBy08)
        }
        containerText.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offsetSides)
            make.right.equalToSuperview().inset(CGFloat.offsetSides)
            make.bottom.equalTo(addButton.snp.top)
            make.top.equalTo(containerImage.snp.bottom).offset(CGFloat.offset10)
        }
        foodImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.offset15)
            make.left.equalToSuperview().offset(CGFloat.offset15)
            make.right.equalToSuperview().inset(CGFloat.offset10)
            make.bottom.equalToSuperview().inset(CGFloat.offset10)
        }
        addButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offset15)
            make.right.equalToSuperview().inset(CGFloat.offset15)
            make.height.equalTo(CGFloat.buttonSide)
            make.top.equalTo(foodDescription.snp.bottom).offset(CGFloat.offset15)
        }
        closeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(CGFloat.offset10)
            make.top.equalToSuperview().offset(CGFloat.offset10)
            make.width.equalTo(CGFloat.sideButton)
            make.height.equalTo(CGFloat.sideButton)
        }
        favButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.offset10)
            make.right.equalToSuperview().inset(CGFloat.sideButton + CGFloat.offset10*2)
            make.width.equalTo(CGFloat.sideButton)
            make.height.equalTo(CGFloat.sideButton)
        }
        foodTitle.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.top.equalToSuperview()
        }
        foodCost.snp.makeConstraints { make in
            make.top.equalTo(foodTitle.snp.bottom).offset(CGFloat.offset7)
            make.left.equalToSuperview()
        }
        foodWeight.snp.makeConstraints { make in
            make.top.equalTo(foodTitle.snp.bottom).offset(CGFloat.offset7)
            make.left.equalTo(foodCost.snp.right).offset(CGFloat.offset10)
        }
        foodDescription.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(foodCost.snp.bottom).offset(CGFloat.offset10)
        }
    }
    private func setupInfo(){
        foodImage.image = food.image
        foodTitle.text = food.name
        foodCost.text = String(food.price) + " ₽"
        foodWeight.text = String(food.weight) + "г"
        foodDescription.text = food.description
    }
    @objc private func addTapped(){
        CartManager.shared.cart = food
        dismiss(animated: true, completion: nil)
    }
    @objc private func favTapped(){
    }
    @objc private func closeTapped(){
        dismiss(animated: true, completion: nil)
    }
}
