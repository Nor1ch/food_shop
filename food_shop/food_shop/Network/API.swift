//
//  API.swift
//  food_shop
//
//  Created by Nor1 on 03.07.2023.
//

import Foundation
import Combine
import UIKit

final class API {
    
    static func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    static func fetchImage(_ url: String) -> AnyPublisher<UIImage, Never> {
        guard let url = API.url(string: url) else {
            return Just(UIImage()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) ?? UIImage() }
            .replaceError(with: UIImage())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    static func url(string: String) -> URL? {
        URL(string: string)
    }
}
