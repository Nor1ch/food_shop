//
//  RouterProtocol.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//
import Foundation
import UIKit

protocol Closable: AnyObject {
    func close()
    func close(completion: (() -> Void)?)
}

protocol Dismissable: AnyObject {
    func dismiss()
    func dismiss(completion: (() -> Void)?)
}

protocol Routable: AnyObject {
    func route(to viewController: UIViewController, as transition: Transition)
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?)
}

protocol Router: Routable {
    var root: UIViewController? { get set }
}
