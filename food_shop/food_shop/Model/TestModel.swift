//
//  TestModel.swift
//  food_shop
//
//  Created by Nor1 on 30.06.2023.
//

import Foundation
import UIKit

struct TestModel {
    let name: String
    let image: UIImage
    
    static func makePlaceHolder()-> TestModel {
        TestModel(name: "Пекарни и кондитерские", image: UIImage(named: "categorytest")!)
    }
}

struct TestModelDescritprion {
    let title: String
    let image: UIImage
    let cost: Int
    let weight: Int
    let description: String
    
    static func makePlaceholder() -> TestModelDescritprion {
        TestModelDescritprion(title: "Рыба с овощами и рисом", image: UIImage(named: "categorytest")!, cost: 799, weight: 560, description: "Рыба маринованна со специями, лимонным соком, соевым соусом и запеченная в духовке с лучком, томатами и картошечкой под золотистой мйонезно-сырной шубкой")
    }
}
