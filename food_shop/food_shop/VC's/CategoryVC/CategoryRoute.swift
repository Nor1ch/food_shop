//
//  CategoryRoute.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import UIKit

protocol CategoryRoute {
    func openCategory()
    func makeCategory() -> UIViewController
}

extension MainRoute where Self: Router {
    func openCategory(transition: Transition) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = CategoryViewModel(router: router)
        let flow = UICollectionViewCompositionalLayout.layoutWithTags()
        let viewController = CategoryVC(viewModel: viewModel, collectionView: CustomCollectionView(flowLayout: flow))
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openCategory(){
        openCategory(transition: PushTransition())
    }
    func makeCategory() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = CategoryViewModel(router: router)
        let flow = UICollectionViewCompositionalLayout.layoutWithTags()
        let viewController = CategoryVC(viewModel: viewModel, collectionView: CustomCollectionView(flowLayout: flow))
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: "Главная", image: Constants.Images.home, tag: 0)
        return navigation
    }
}

extension MainRouter: CategoryRoute {}
