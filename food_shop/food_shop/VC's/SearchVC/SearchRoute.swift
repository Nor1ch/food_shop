//
//  SearchRoute.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

protocol SearchRoute {
    func makeSearch() -> UIViewController
//    func openSearch()
}

extension MainRoute where Self: Router {
    func makeSearch() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: "Поиск", image: Constants.Images.search, tag: 2)
        return navigation
    }
//    func openSearch(transition: Transition) {
//        let router = MainRouter(rootTransition: EmptyTransition())
//        let viewModel = MainViewModel(router: router)
//        let viewController = MainVC(viewModel: viewModel)
//        router.root = viewController
//        route(to: viewController, as: transition)
//    }
//    func openSearch(){
//        openProfile(transition: PushTransition())
//    }
}

extension MainRouter: SearchRoute {}
