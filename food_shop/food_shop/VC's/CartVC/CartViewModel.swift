//
//  CartViewModel.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation

final class CartViewModel {
    
    private let router: MainRouter
    let array = [TestModelCart.makePlaceHolder(),TestModelCart.makePlaceHolder(),TestModelCart.makePlaceHolder(),TestModelCart.makePlaceHolder(),TestModelCart.makePlaceHolder(),TestModelCart.makePlaceHolder(),]
    
    init(router: MainRouter){
        self.router = router
    }
}
