//
//  ProductDetailsViewModel.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

final class ProductDetailsViewModel: ObservableObject {
    @Published var dish = Dish(id: 0, name: "", price: 0, weight: 0, description: "", imageURL: "", tegs: [])
}
