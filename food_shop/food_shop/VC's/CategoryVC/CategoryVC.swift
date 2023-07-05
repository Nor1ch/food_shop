//
//  CategoryVC.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import Combine
import UIKit

private extension CGFloat {
    static let rightNavButtonSize = 40.0
}

final class CategoryVC: UIViewController {
    
    private let viewModel: CategoryViewModel
    private let collectionView: UICollectionView
    private var cancelable = Set<AnyCancellable>()
    private var array: [FoodModelCompl] = []
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.Images.vector, for: .normal)
        view.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        return view
    }()
    
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
        view.backgroundColor = Constants.Colors.white
        setupViews()
        makeConstraints()
        setupCollectionView()
        bind()
    }
    private func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(backButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(image: Constants.Images.user, frame: CGRect(x: 0, y: 0, width: CGFloat.rightNavButtonSize, height: CGFloat.rightNavButtonSize)))
        
    }
    private func setupCollectionView(){
        collectionView.register(FoodOfCategory.self, forCellWithReuseIdentifier: "\(FoodOfCategory.self)")
        collectionView.register(FoodCategorySingle.self, forCellWithReuseIdentifier: "\(FoodCategorySingle.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func makeConstraints(){
        collectionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    private func bind(){
        viewModel.$food
            .sink(receiveValue: { array in
                self.array = array
                self.collectionView.reloadSections(IndexSet(integer: 1))
            })
            .store(in: &cancelable)
    }
    private func transformCell(_ cell: UICollectionViewCell) {
        let cell = cell as? FoodOfCategory
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            cell?.backgroundColor =  Constants.Colors.blue
            cell?.setupTextColor(color: .white)
        })
        for otherCell in collectionView.visibleCells {
            if otherCell != cell {
                if otherCell.backgroundColor == Constants.Colors.blue {
                    otherCell.backgroundColor = Constants.Colors.background_white
                    let cell = otherCell as? FoodOfCategory
                    cell?.setupTextColor(color: .black)
                    
                }
            }
        }
    }
    private func makeSort(array: [FoodModelCompl], teg: Tegs) -> [FoodModelCompl] {
        switch teg {
        case .all:
            return array
        case .rice:
            return array.filter { $0.tegs.contains(.rice) }
        case .salad:
            return array.filter { $0.tegs.contains(.salad) }
        case .fish:
            return array.filter { $0.tegs.contains(.fish) }
        case .none:
            return array
        }
    }
    @objc private func backPressed(){
        navigationController?.popToRootViewController(animated: true)
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
            return array.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodOfCategory.self)", for: indexPath) as? FoodOfCategory else { return UICollectionViewCell() }
             let item = viewModel.tags[indexPath.row]
             if item == Tegs.all && item != Tegs.fish {
                 cell.backgroundColor = Constants.Colors.blue
                 cell.setupTextColor(color: .white)
             }
             cell.setupCell(name: item.rawValue)
             return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FoodCategorySingle.self)", for: indexPath) as? FoodCategorySingle else { return UICollectionViewCell() }
             let item = array[indexPath.row]
             cell.setupCell(name: item.name, image: item.image)
             return cell
        }
    }
}
extension CategoryVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            transformCell(collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell())
            let teg = viewModel.tags[indexPath.row]
            self.array = makeSort(array: viewModel.food, teg: teg)
            collectionView.reloadSections(IndexSet(integer: 1))
            
        default:
            viewModel.openDetails(food: array[indexPath.row])
        }
    }
}
