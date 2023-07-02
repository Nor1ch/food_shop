//
//  ProfileRoute.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

protocol ProfileRoute {
    func makeProfile() -> UIViewController
//    func openProfile()
}

extension MainRoute where Self: Router {
    func makeProfile() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileVC(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: viewController)
        router.root = viewController
        navigation.tabBarItem = UITabBarItem(title: "Аккаунт", image: Constants.Images.profile, tag: 4)
        return navigation
    }
//    func openProfile(transition: Transition) {
//        let router = MainRouter(rootTransition: EmptyTransition())
//        let viewModel = ProfileViewModel(router: router)
//        let viewController = MainVC(viewModel: viewModel)
//        router.root = viewController
//        route(to: viewController, as: transition)
//    }
//    func openProfile(){
//        openProfile(transition: PushTransition())
//    }
}

extension MainRouter: ProfileRoute {}
