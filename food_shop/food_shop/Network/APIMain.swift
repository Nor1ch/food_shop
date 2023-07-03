//
//  APIMain.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import Combine

func fetchCategories() -> AnyPublisher<[CategoryModelCompl], Never> {
    guard let url = API.url(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else {
        return Just([]).eraseToAnyPublisher()
    }
    return API.fetch(url)
        .map { (response: CategoryModelContainer) -> [CategoryModel] in
            return response.сategories
        }
        .map { models in
            Publishers.MergeMany(models.map ({model in
                API.fetchImage(model.image_url)
                    .map { image in
                        CategoryModelCompl(id: model.id, name: model.name, image: image)
                    }
            }))
                .collect(models.count)
        }
        .switchToLatest()
        .replaceError(with: [])
        .eraseToAnyPublisher()
}

