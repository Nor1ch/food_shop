//
//  CartManager.swift
//  food_shop
//
//  Created by Nor1 on 04.07.2023.
//

import Foundation
import UIKit
import Combine

final class CartManager {
    static let shared = CartManager()
    @Published var cart: FoodModelCompl = FoodModelCompl(id: 2, name: "", price: 0, weight: 0, description: "", image: UIImage(), tegs: [.none])
    private init(){}
}
