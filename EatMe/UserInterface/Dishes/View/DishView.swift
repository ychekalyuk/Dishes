//
//  DishView.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

struct DishView: View {
    @StateObject private var viewModel = DishViewModel()
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
        VStack {
            NavigationBarView(title: title, backButtonAction: {
                presentationMode.wrappedValue.dismiss()
            })
            FilterGrid(viewModel: viewModel)
                .padding(.horizontal, 16.dhs)
            DishesGrid(viewModel: viewModel)
                .padding(.horizontal, 16.dhs)
                .padding(.bottom, 88.dvs)
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: - Subviews
struct FilterGrid: View {
    @ObservedObject var viewModel: DishViewModel
    private let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(viewModel.tags, id: \.self) { tag in
                    DishFilterElementView(title: tag, viewModel: viewModel)
                }
            }
        }
        .frame(height: 35.dhs)
    }
}

struct DishesGrid: View {
    @ObservedObject var viewModel: DishViewModel
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var isShowDetails = false
    @State private var selectedDish: Dish? = nil
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.filteredDishes, id: \.id) { dish in
                        VStack {
                            DishCellView(name: dish.name, imageURL: dish.imageURL)
                                .onTapGesture {
                                    selectedDish = dish
                                }
                                .fullScreenCover(item: $selectedDish) { dish in
                                    ProductDetailsView(likeAction: { viewModel.setFavoriteStatus(id: dish.id) }, addInCartAction: { viewModel.addDishInCart(dish: dish) }, dish: dish, isLiked: false)
                                        .padding(.horizontal, 16.dhs)
                                }
                            Spacer()
                                .frame(height: 30.dvs)
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(title: "Азиатская кухня")
    }
}
