//
//  CategoryVC.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import UIKit

private extension CGFloat {
    static let rightNavButtonSize = 40.0
}

final class CategoryVC: UIViewController {
    
    private let viewModel: CategoryViewModel
    private let collectionView: UICollectionView
    
    init(viewModel: CategoryViewModel, collectionView: UICollectionView){
        self.viewModel = viewModel
        self.collectionView = collectionView
        super.init(nibName: nil, bundle: nil)
        setupViews()
        setupCollectionView()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        makeConstraints()
        setupCollectionView()
    }
    private func setupViews(){
        view.addSubview(collectionView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(image: UIImage(named: "t")!, frame: CGRect(x: 0, y: 0, width: CGFloat.rightNavButtonSize, height: CGFloat.rightNavButtonSize)))
        
    }
    private func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FoodOfCategory.self, forCellWithReuseIdentifier: "\(FoodOfCategory.self)")
        collectionView.register(FoodCategorySingle.self, forCellWithReuseIdentifier: "\(FoodCategorySingle.self)")
    }
    private func makeConstraints(){
        collectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
}

extension CategoryVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.tags.count
        default:
            return viewModel.array.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodOfCategory.self)", for: indexPath) as? FoodOfCategory else { return UICollectionViewCell() }
             let item = viewModel.tags[indexPath.row]
             cell.setupCell(name: item)
             return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodCategorySingle.self)", for: indexPath) as? FoodCategorySingle else { return UICollectionViewCell() }
             let item = viewModel.array[indexPath.row]
             cell.setupCell(name: item.name, image: item.image)
             return cell
        }
    }
}
extension CategoryVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.openDetails()
    }
}
