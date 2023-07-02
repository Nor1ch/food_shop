//
//  CategoryViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation

final class CategoryViewModel {
    typealias Route = DetailsRoute
    private let router: Route
    let array = [TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder()]
    
    let tags = ["Салат","Еда","Творог","Творог","Салат","Салат","Салат","Салат","Салат","Салат","Еда","Творог","Творог","Салат","Салат","Салат","Салат","Салат","Салат","Еда","Творог","Творог","Салат","Салат","Салат","Салат","Салат","Салат","Еда","Творог","Творог","Салат","Салат","Салат","Салат","Салат","Салат"]
    
    init(router: Route){
        self.router = router
    }
    
    func openDetails(){
        router.openDetails()
    }
}
