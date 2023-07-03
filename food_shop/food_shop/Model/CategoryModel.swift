//
//  CategoryModel.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import UIKit

struct CategoryModelContainer: Decodable {
    let сategories: [CategoryModel]
    
    static func makePlaceholder() -> CategoryModelContainer {
        CategoryModelContainer(сategories: [])
    }
}
struct CategoryModel: Decodable {
    let id: Int
    let name: String
    let image_url: String
}
struct CategoryModelCompl {
    let id: Int
    let name: String
    let image: UIImage
}
