//
//  FoodModel.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import UIKit

struct FoodModel: Decodable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image_url: String
    let tegs: [String]
}
struct FoodModelContainer: Decodable {
    let dishes: [FoodModel]
}
struct FoodModelCompl {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image: UIImage
    let tegs: [Tegs]
}

enum Tegs: String, CaseIterable {
    case all = "Все меню"
    case rice = "С рисом"
    case salad = "Салаты"
    case fish = "С рыбой"
    case none
}

extension CaseIterable {
    static func convertArrayToTegs(array: [String]) -> [Tegs] {
        var converted: [Tegs] = []
        array.forEach { item in
            converted.append(Tegs.allCases.first { item == $0.rawValue} ?? Tegs.none)
        }
        return converted
    }
}
