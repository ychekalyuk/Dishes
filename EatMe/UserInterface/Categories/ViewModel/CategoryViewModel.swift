//
//  CategoryViewModel.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI
import Combine

final class CategoryViewModel: ObservableObject {
    @Published var сategories: [Category] = []
    var cancellation: AnyCancellable?
    private let networkService = NetworkService()
    
    init() {
      fetchCategories()
    }
    
    private func fetchCategories() {
        cancellation = networkService.fetchCategories()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { сategories in
                self.сategories = сategories.сategories
            })
    }
}
