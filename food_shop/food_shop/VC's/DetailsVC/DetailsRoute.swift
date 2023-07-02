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
    func openDetails()
}

extension MainRoute where Self: Router {
    func openDetails(transition: Transition) {
        let router = MainRouter(rootTransition: EmptyTransition())
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailsVC(viewModel: viewModel)
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openDetails(){
        openDetails(transition: ModalTransition())
    }
}

extension MainRouter: DetailsRoute {}
