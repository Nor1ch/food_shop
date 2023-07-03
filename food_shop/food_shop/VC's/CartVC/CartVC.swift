//
//  CartVC.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

private extension CGFloat {
    static let rightNavButtonSize = 40.0
    static let leftNavHeight = 80
    static let leftNavWidth = 200
    static let corner10 = 10.0
    static let offsetSides = 15.0
    static let buttonHeight = 50.0
    static let rowHeight = 90.0
}

final class CartVC: UIViewController {
    
    private let viewModel: CartViewModel
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    private lazy var payButton : UIButton = {
        let view = UIButton()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Constants.Colors.blue
        config.background.cornerRadius = CGFloat.corner10
        config.cornerStyle = .fixed
        config.title = "Оплатить 2004 р"
        view.configuration = config
        view.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        return view
    }()
    init(viewModel: CartViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        setupTableView()
        
    }
    private func setupViews(){
        view.backgroundColor = Constants.Colors.white
        view.addSubview(payButton)
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(image: UIImage(named: "t")!, frame: CGRect(x: 0, y: 0, width: CGFloat.rightNavButtonSize, height: CGFloat.rightNavButtonSize)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: CustomNavBarItem(city: "Cанкт-Петерург", date: "12 сентября 2023", frame: CGRect(x: 0, y: 0, width: CGFloat.leftNavWidth, height: CGFloat.leftNavHeight)))
    }
    private func setupTableView(){
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "\(CartTableViewCell.self)")
        tableView.rowHeight = CGFloat.rowHeight
    }
    private func makeConstraints(){
        payButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.offsetSides)
            make.right.equalToSuperview().inset(CGFloat.offsetSides)
            make.height.equalTo(CGFloat.buttonHeight)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(CGFloat.offsetSides)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(CGFloat.offsetSides)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(payButton.snp.top)
        }
    }
    @objc private func addTapped(){
        
    }
}

extension CartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CartTableViewCell.self)") as? CartTableViewCell else {return UITableViewCell ()}
        let item = viewModel.array[indexPath.row]
        cell.setupCell(model: item)
        return cell
    }
    
    
}
extension CartVC: UITableViewDelegate {
    
}
