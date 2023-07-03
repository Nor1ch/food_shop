//
//  CategoryViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import Combine

final class CategoryViewModel {
    @Published var food: [FoodModelCompl] = []
    let tags = [Tegs.all.rawValue, Tegs.salad.rawValue, Tegs.rice.rawValue, Tegs.fish.rawValue]
    private var cancelable = Set<AnyCancellable>()
    typealias Route = DetailsRoute
    private let router: Route
    init(router: Route){
        self.router = router
        fetchFood()
            .sink { model in
                self.food = model
            }
            .store(in: &cancelable)
    }
    
    func openDetails(food: FoodModelCompl){
        router.openDetails(food: food)
    }
}
