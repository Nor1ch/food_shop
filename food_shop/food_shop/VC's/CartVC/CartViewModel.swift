//
//  CartViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import UIKit
import Combine

final class CartViewModel {
    private var cancelable = Set<AnyCancellable>()
    private let router: MainRouter
    @Published var model: FoodModelCompl = FoodModelCompl(id: 2, name: "", price: 3, weight: 3, description: "", image: UIImage(), tegs: [.none])
    @Published var array : [FoodModelCompl] = []
    
    init(router: MainRouter){
        self.router = router
        CartManager.shared.$cart
            .sink(receiveValue: {model in
                self.model = model
            })
            .store(in: &cancelable)
    }
}
