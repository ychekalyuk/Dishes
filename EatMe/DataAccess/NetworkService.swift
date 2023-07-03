//
//  NetworkService.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import Alamofire
import Combine

final class NetworkService {
    private let categoriesURLString = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54" // Главный экран - 4 большие плитки меню
    private let dishesURLString = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b" // Меню с тарелочками - категории
    
    func fetchCategories() -> AnyPublisher<Categories, AFError> {
        let publisher = AF.request(categoriesURLString).publishDecodable(type: Categories.self)
        return publisher.value()
    }
    
    func fetchDishes() -> AnyPublisher<Dishes, AFError> {
        let publisher = AF.request(dishesURLString).publishDecodable(type: Dishes.self)
        return publisher.value()
    }
}
