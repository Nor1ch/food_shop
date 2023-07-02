//
//  CustomNavBarItem.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import SnapKit
import UIKit

private extension CGFloat {
    static let multipiedBy01 = 0.1
    static let multipiedBy05 = 0.5
    static let multipiedBy03 = 0.3
    static let offset = 8.0
    static let offsetDate = 4.0
    static let imageSize = 40.0
    
}

final class CustomNavBarItem: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = Constants.Images.location
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.MainScreen.city
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.Font.MainScreen.date
        view.textColor = Constants.Colors.gray
        return view
    }()
    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    init(city: String, date: String, frame: CGRect){
        super.init(frame: frame)
        self.frame = frame
        setupView()
        makeConstraints()
        cityLabel.text = city
        dateLabel.text = date
    }
    init(image: UIImage, frame: CGRect){
        super.init(frame: frame)
        setupProfileImage()
        makeConstraintsProfileImage()
        profileImage.image = image
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        addSubview(imageView)
        addSubview(cityLabel)
        addSubview(dateLabel)
    }
    private func makeConstraints(){
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(CGFloat.offsetDate)
            make.height.equalToSuperview().multipliedBy(CGFloat.multipiedBy05)
            make.width.equalToSuperview().multipliedBy(CGFloat.multipiedBy01)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(CGFloat.offset)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat.multipiedBy05)
        }
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(CGFloat.offset)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat.multipiedBy03)
            make.bottom.equalToSuperview().inset(CGFloat.offsetDate)
        }
    }
    private func setupProfileImage(){
        addSubview(profileImage)
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
    private func makeConstraintsProfileImage(){
        profileImage.snp.makeConstraints { make in
            make.width.equalTo(CGFloat.imageSize)
            make.height.equalTo(CGFloat.imageSize)
        }
    }
}
