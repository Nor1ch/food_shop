//
//  CategoryRoute.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import UIKit

protocol CategoryRoute {
    func openCategory(title: String)
}

extension MainRoute where Self: Router {
    func openCategory(transition: Transition, title: String) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = CategoryViewModel(router: router)
        let flow = UICollectionViewCompositionalLayout.layoutWithTags()
        let viewController = CategoryVC(viewModel: viewModel, collectionView: CustomCollectionView(flowLayout: flow))
        router.root = viewController
        viewController.title = title
        route(to: viewController, as: transition)
    }
    func openCategory(title: String){
        openCategory(transition: PushTransition(),title: title)
    }
}

extension MainRouter: CategoryRoute {}
