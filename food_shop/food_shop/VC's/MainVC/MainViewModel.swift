//
//  MainVCViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import Combine

final class MainViewModel {
    @Published var categories: [CategoryModelCompl] = []
    typealias Route = MainRoute & CategoryRoute
    private var cancelables = Set<AnyCancellable>()
    private let router: Route
    init(router: Route){
        self.router = router
        fetchCategories()
            .sink { model in
                self.categories = model
            }.store(in: &cancelables)
    }
    
    func openCategory(title: String){
        router.openCategory(title: title)
    }
}
