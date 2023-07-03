//
//  Category.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

struct Categories: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
    }
}
