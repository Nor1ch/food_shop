//
//  CartRoute.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import UIKit

protocol CartRoute {
    func makeCart() -> UIViewController
}

extension MainRoute where Self: Router {
    func makeCart() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = CartViewModel(router: router)
        let viewController = CartVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: "Корзина", image: Constants.Images.cart, tag: 3)
        return navigation
    }
}

extension MainRouter: CartRoute {}
