//
//  DishDataBaseObject.swift
//  EatMe
//
//  Created by Юрий Альт on 02.07.2023.
//

import RealmSwift
import Foundation

class DishDataBaseObject: Object {
    @Persisted dynamic var id = 0
    @Persisted dynamic var name = ""
    @Persisted dynamic var price = 0
    @Persisted dynamic var weight = 0
    @Persisted dynamic var imageURL = ""
    @Persisted dynamic var quantity = 0
    @Persisted dynamic var isFavorite = false
}
