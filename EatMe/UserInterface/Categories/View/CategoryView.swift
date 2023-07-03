//
//  CategoryView.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var viewModel = CategoryViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBarWithGeoView()
                MainCategoriesGrid(viewModel: viewModel)
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

//MARK: - Subviews
struct MainCategoriesGrid: View {
    @ObservedObject var viewModel: CategoryViewModel
    private let columns = [GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(viewModel.сategories, id: \.id) { category in
                    NavigationLink(destination: DishView(title: category.name)) {
                        CategoryCellView(name: category.name, imageURL: category.imageURL)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

//MARK: - Preview
struct Category_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}


