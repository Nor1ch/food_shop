//
//  MainRoute.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

protocol MainRoute {
    func makeMain() -> UIViewController
}

extension MainRoute where Self: Router {
    func makeMain() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = MainViewModel(router: router)
        let flow = UICollectionViewFlowLayout.singleItemInRow()
        let viewController = MainVC(viewModel: viewModel, collectionView: CustomCollectionView(flowLayout: flow))
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: "Главная", image: Constants.Images.home, tag: 0)
        return navigation
    }
}

extension MainRouter: MainRoute {}
