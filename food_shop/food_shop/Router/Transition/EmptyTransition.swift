//
//  EmptyTransition.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

class EmptyTransition : Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
