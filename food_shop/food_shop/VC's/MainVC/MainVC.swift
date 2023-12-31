//
//  MainVC.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import Combine
import SnapKit
import UIKit


private extension CGFloat {
    static let size = 60.0
    static let imageHeight = 40.0
    static let navoffset = 25.0
    static let rightNavButtonSize = 40.0
    static let leftNavHeight = 80
    static let leftNavWidth = 200
}
final class MainVC: UIViewController {
    
    private let viewModel: MainViewModel
    private let collectionView: UICollectionView
    private var cancelable = Set<AnyCancellable>()
    
    init(viewModel: MainViewModel, collectionView: UICollectionView){
        self.viewModel = viewModel
        self.collectionView = collectionView
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        setupCollectionView()
        bind()
    }
    
    private func setupViews(){
        view.addSubview(collectionView)
        view.backgroundColor = Constants.Colors.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(image: Constants.Images.user, frame: CGRect(x: 0, y: 0, width: CGFloat.rightNavButtonSize, height: CGFloat.rightNavButtonSize)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(city: "Cанкт-Петерург", date: "12 Cентября 2023", frame: CGRect(x: 0, y: 0, width: CGFloat.leftNavWidth, height: CGFloat.leftNavHeight)))
    }
    private func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "\(CategoryCell.self)")
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
        viewModel.$categories
            .sink(receiveValue: { models in
                self.collectionView.reloadData()})
            .store(in: &cancelable)
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCell.self)", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        let item = viewModel.categories[indexPath.row]
        cell.setupCell(name: item.name, image: item.image)
        return cell
    }
}
extension MainVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.openCategory(title: viewModel.categories[indexPath.row].name)
    }
}
