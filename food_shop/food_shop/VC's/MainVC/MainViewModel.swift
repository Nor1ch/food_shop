//
//  MainVCViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation

final class MainViewModel {
    typealias Route = MainRoute & CategoryRoute
    private let router: Route
    let array = [TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),TestModel.makePlaceHolder(),]
    init(router: Route){
        self.router = router
    }
    
    func openCategory(){
        router.openCategory()
    }
}
