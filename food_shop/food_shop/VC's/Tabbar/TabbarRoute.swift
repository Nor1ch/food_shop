//
//  TabbarRoute.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import UIKit

protocol TabbarRoute {
    func makeTabbar() -> UIViewController
}

extension TabbarRoute where Self: Router {
    func makeTabbar() -> UIViewController {
        let router = MainRouter(rootTransition: EmptyTransition())
        let tabs = [router.makeMain(),router.makeSearch(), router.makeCart(), router.makeProfile()]
        let tabBar = UITabBarController()
        tabBar.viewControllers = tabs
        tabBar.tabBar.backgroundColor = .white
        router.root = tabBar
        return tabBar
    }
}

extension MainRouter : TabbarRoute {

}
