//
//  DetailsRoute.swift
//  food_shop
//
//  Created by Nor1 on 02.07.2023.
//

import Foundation


import Foundation
import UIKit

protocol DetailsRoute {
    func openDetails(food: FoodModelCompl)
}

extension MainRoute where Self: Router {
    func openDetails(transition: Transition, food: FoodModelCompl) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailsVC(viewModel: viewModel, food: food)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openDetails(food: FoodModelCompl){
        openDetails(transition: ModalTransition(), food: food)
    }
}

extension MainRouter: DetailsRoute {}
