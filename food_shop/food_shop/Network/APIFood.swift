//
//  APIFood.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import Combine

func fetchFood() -> AnyPublisher<[FoodModelCompl], Never> {
    guard let url = API.url(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else {
        return Just([]).eraseToAnyPublisher()
    }
    return API.fetch(url)
        .map { (response: FoodModelContainer) -> [FoodModel] in
            return response.dishes
        }
        .flatMap { models in
            Publishers.MergeMany(models.map ({model in
                API.fetchImage(model.image_url)
                    .map { image in
                        FoodModelCompl(id: model.id, name: model.name, price: model.price, weight: model.weight, description: model.description, image: image, tegs: Tegs.convertArrayToTegs(array: model.tegs))
                    }
            }))
                .collect(models.count)
        }
//        .switchToLatest()
        .replaceError(with: [])
        .eraseToAnyPublisher()
}
