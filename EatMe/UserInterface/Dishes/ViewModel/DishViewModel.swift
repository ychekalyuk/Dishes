//
//  DishViewModel.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI
import Combine

final class DishViewModel: ObservableObject {
    @Published var dishes: [Dish] = []
    @Published var tags: [String] = []
    @Published var filteredDishes: [Dish] = []
    @Published var selectedTag: String = "Все меню"
    var cancellation: AnyCancellable?
    private let networkService = NetworkService()
    private let storageService = StorageService()
    
    init() {
        fetchDishes()
             print("Database FilePath : ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found")
    }
    
    func filterByTags(isSelected: Bool, tag: String) {
        if !isSelected {
            filteredDishes = dishes
        } else {
            filteredDishes = dishes.filter { $0.tegs.contains(tag) }
        }
        selectedTag = tag
    }
    
    func getFilters() {
        var tempSet: Set<String> = []
        dishes.forEach { dish in
            tempSet.formUnion(dish.tegs)
        }
        tags = Array(tempSet).sorted()
    }
    
    func addDishInCart(dish: Dish) {
        if storageService.checkDish(id: dish.id) {
            storageService.setQuantity(for: dish.id)
        } else {
            let newDish = DishDataBaseObject()
            newDish.id = dish.id
            newDish.name = dish.name
            newDish.price = dish.price
            newDish.weight = dish.weight
            newDish.imageURL = dish.imageURL
            newDish.quantity = 1
            newDish.isFavorite = false
            storageService.addDishInCart(dish: newDish)
        }
    }
    
    func setFavoriteStatus(id: Int) {
        if storageService.checkDish(id: id) {
            storageService.setFavoriteStatus(for: id)
        } else {
            let newDish = DishDataBaseObject()
            newDish.id = id
            newDish.isFavorite = true
            storageService.addDishInCart(dish: newDish)
        }
    }
    
    func getFavoriteStatus(id: Int) -> Bool {
        storageService.getFavoriteStatus(for: id)
    }
    
    private func fetchDishes() {
        cancellation = networkService.fetchDishes()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { dishes in
                self.dishes = dishes.dishes
                self.filteredDishes = dishes.dishes
                self.getFilters()
            })
    }
}
