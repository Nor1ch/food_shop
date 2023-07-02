//
//  Constants.swift
//  food_shop
//
//  Created by Nor1 on 29.06.2023.
//

import Foundation
import UIKit

enum Constants {
    enum Images {
        static var home: UIImage {
            UIImage(named: "home") ?? UIImage()
        }
        static var search: UIImage {
            UIImage(named: "search") ?? UIImage()
        }
        static var cart: UIImage {
            UIImage(named: "cart") ?? UIImage()
        }
        static var profile: UIImage {
            UIImage(named: "profile") ?? UIImage()
        }
        static var location: UIImage {
            UIImage(named: "location") ?? UIImage()
        }
        static var favorite: UIImage {
            UIImage(named: "favorite") ?? UIImage()
        }
        static var close: UIImage {
            UIImage(named: "close") ?? UIImage()
        }
    }
    enum Font {
        enum MainScreen {
            static var city: UIFont? {
                UIFont(name: "Montserrat-SemiBold", size: 18)
            }
            static var date: UIFont? {
                UIFont(name: "Montserrat-Light", size: 14)
            }
            static var categoryName: UIFont? {
                UIFont(name: "Montserrat-SemiBold", size: 20)
            }
        }
        enum CategoryScreen {
            static var categoryName: UIFont? {
                UIFont(name: "Montserrat-Medium", size: 14)
            }
        }
        enum DetailsScreen {
            static var foodName: UIFont? {
                UIFont(name: "Montserrat-SemiBold", size: 16)
            }
            static var foodCost: UIFont? {
                UIFont(name: "Montserrat-Medium", size: 14)
            }
            static var foodWeight: UIFont? {
                UIFont(name: "Montserrat-Light", size: 14)
            }
            static var foodDescription: UIFont? {
                UIFont(name: "Montserrat-Light", size: 13)
            }
        }
    }
    enum Colors {
        static var white: UIColor? {
            UIColor(named: "white")
        }
        static var background_white: UIColor? {
            UIColor(named: "background_white")
        }
        static var black: UIColor? {
            UIColor(named: "black")
        }
        static var gray: UIColor? {
            UIColor(named: "gray")
        }
        static var light_gray: UIColor? {
            UIColor(named: "light_gray")
        }
        static var blue: UIColor? {
            UIColor(named: "blue")
        }
    }
}
