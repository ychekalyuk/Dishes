//
//  Dish.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

struct Dishes: Decodable {
    let dishes: [Dish]
}

struct Dish: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageURL: String
    let tegs: [String]
    
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case weight
        case description
        case imageURL = "image_url"
        case tegs
    }
    
    static func emptyDish() -> Dish {
        Dish(id: 0, name: "Some name", price: 0, weight: 0, description: "Some description", imageURL: "https://yoomag.ru/image/cache/no_image-1500x1500.png", tegs: [])
    }
}
