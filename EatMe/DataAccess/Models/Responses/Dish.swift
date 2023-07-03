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
}
