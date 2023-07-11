//
//  StorageService.swift
//  EatMe
//
//  Created by Юрий Альт on 02.07.2023.
//

import RealmSwift

class StorageService {
    private var realm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
            }
            catch {
                print("Could not access database: ", error)
            }
            return self.realm
        }
    }
    
    func addDishInCart(dish: DishDataBaseObject) {
        write {
            realm.add(dish)
        }
    }
    
    func setQuantity(for dishId: Int) {
        write {
            let dish = realm.objects(DishDataBaseObject.self).where { $0.id == dishId }.first
            dish?.quantity += 1
        }
    }
    
    func getQuantity(for dishId: Int) -> Int {
        let dish = realm.objects(DishDataBaseObject.self).where { $0.id == dishId }.first
        return dish?.quantity ?? 0
    }
    
    func setFavoriteStatus(for dishId: Int) {
        write {
            let dish = realm.objects(DishDataBaseObject.self).where { $0.id == dishId }.first
            dish?.isFavorite.toggle()
        }
    }
    
    func getFavoriteStatus(for dishId: Int) -> Bool {
        let dish = realm.objects(DishDataBaseObject.self).where { $0.id == dishId }.first
        return dish?.isFavorite ?? false
    }
    
    func getDishesFromCart(dishId: Int) -> DishDataBaseObject? {
        realm.objects(DishDataBaseObject.self).where { $0.id == dishId }.first
    }
    
    func checkDish(id: Int) -> Bool {
        var isContains = false
        let objects = realm.objects(DishDataBaseObject.self)
        for object in objects {
            if object.id == id {
                isContains = true
            }
        }
        return isContains
    }
    
    func getAllDishes() -> [Dish] {
        var dishes: [Dish] = []
        let results = realm.objects(DishDataBaseObject.self).where { $0.quantity > 0 }
        
        Array(results).forEach { result in
            let dish = Dish(id: result.id, name: result.name, price: result.price, weight: result.weight, description: "", imageURL: result.imageURL, tegs: [])
            dishes.append(dish)
        }
            return dishes
    }
    
    func getAllDishDataBaseObjects() -> [DishDataBaseObject] {
        Array(realm.objects(DishDataBaseObject.self).where { $0.quantity > 0 })
    }
    
    func quantityPlus(id: Int) {
        write {
            let dish = realm.objects(DishDataBaseObject.self).where { $0.id == id }.first
            dish?.quantity += 1
        }
    }
    
    func quantityMinus(id: Int) {
        write {
            let dish = realm.objects(DishDataBaseObject.self).where { $0.id == id }.first
            guard let dish  = dish else { return }
            if dish.quantity >= 2 {
                dish.quantity -= 1
            } else if dish.quantity == 1 {
                realm.delete(dish)
            }
        }
    }
    
    private func write(_ completion: () -> Void) {
        do {
            try realm.write { completion() }
        } catch let error {
            print(error)
        }
    }
}
