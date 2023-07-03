//
//  CartViewModel.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    @Published var dishes: [Dish] = [] {
        didSet {
            print(dishes.count)
        }
    }
    @Published var finalSum = 0
    
    private let storageService = StorageService()
    
    init() {
        getDishes()
        getFinalSum()
    }
    
    
    func getDishes() {
        self.dishes = storageService.getAllDishes()
    }
    
    func quantityMinus(id: Int) {
        storageService.quantityMinus(id: id)
        getDishes()
        getFinalSum()
    }
    
    func quantityPlus(id: Int) {
        storageService.quantityPlus(id: id)
        getDishes()
        getFinalSum()
    }
    
    func getQuantity(id: Int) -> Int {
        storageService.getQuantity(for: id)
    }
    
    func getFinalSum() {
        var finalPrice = 0
        let dataBaseDishes = storageService.getAllDishDataBaseObjects()
        dataBaseDishes.forEach { dish in
            finalPrice += (dish.price * dish.quantity)
        }
        finalSum = finalPrice
    }
}
